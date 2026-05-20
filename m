Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC67325742F;
	Wed, 20 May 2026 06:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779260259; cv=none; b=OHnTw0vuVg1RfYvkSFC2wbk6TnSBkcLrhZzwbj8dxbW6GVwlHWWRzuxbfemzX4aeGb5LPNtR+M6SMHdiI3BwBpK9iGGkRtDPZRdR7+JYqqfzy34EBBejPIOYa548vF9bHjTvLdFJS5M7dkWk47wX+1j7C41qfKtn9cSCw2goH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779260259; c=relaxed/simple;
	bh=1RftdqEDanCNcGRn7uep4DjhhgkSgW1Pfa0PIoZHE6k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mAgVksd4aoBbmFeco33bxoYRf5yjZ6Oy5ihWbmPogKkxcWntF1sHhcRCzNAMEWnmBlCZ9oOfSXGj7mMuPPmZRkL3PKa5dCSw3vxaOLr/K4GN+kX2TSrefGsp+3Ybmzx1BJCFWBiFbq+RXVih/+ioOblEEfKgDDQIiKuo0tPffNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3la4JHZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3la4JHZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792B01F000E9;
	Wed, 20 May 2026 06:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779260257;
	bh=r5UT/v/jwP+5XTbMh1trVgtULaJMxPVMpC6kN5XpHRQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=g3la4JHZgVqmxgse1VG9x40JyjNuLk/M5BcUVOJUiMYlUXZ/2Mb/21pReOVt5rMd0
	 avv4n3i0o7TyvD7Aeo+1DzFyyVOLzoTQsdH7iGRvBKKtqLb+1Z4mAxWVTZ3KqEx/Md
	 SKnMWrJEWg0ZnEnPbsR9f7CSeQs1oas0W3HZtn2Cy1bbJDZYtx1Xe6PCelaT24TD9j
	 lpTrwY00ujNLJHVvqv3FzeNR1ofl1czy+Nl4EC7KoC/fZ0BJZdRPNA3vhZuL79ipph
	 dPyJvp7M6JoPZ+blnb4cZ0poMoGS5D/JtRWIu/BFX04kAw9HZtc+TKhwUpNWHx79Zf
	 4h+ao0s3EePGg==
Message-ID: <f202c8ae-554f-49de-a9d1-add337e28515@kernel.org>
Date: Wed, 20 May 2026 08:57:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: airspy: Guard stop_streaming() against
 disconnected device
To: Valery Borovsky <vebohr@gmail.com>, linux-media@vger.kernel.org,
 mchehab@kernel.org
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20260513052617.140688-1-vebohr@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260513052617.140688-1-vebohr@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/05/2026 07:26, Valery Borovsky wrote:
> airspy_disconnect() clears s->udev under v4l2_lock, but
> airspy_stop_streaming() unconditionally calls airspy_ctrl_msg() and
> airspy_free_stream_bufs() afterwards. If a streaming user closes the
> device after disconnect, stop_streaming() runs and dereferences the
> NULL s->udev:
> 
>   airspy_stop_streaming()
>     airspy_ctrl_msg(s, CMD_RECEIVER_MODE, 0, 0, NULL, 0)
>       usb_sndctrlpipe(s->udev, 0)         /* NULL deref */
>     airspy_free_stream_bufs(s)
>       usb_free_coherent(s->udev, ...)     /* NULL deref */
> 
> Mirror the precedent set by sibling SDR drivers msi2500 and pwc, which
> already guard their hardware teardown block with an "if (udev)" check.
> The queued-buffer drain via airspy_cleanup_queued_bufs() must still
> run unconditionally so vb2 sees its buffers returned.
> 
> Issue identified by automated review of the INV-003 series at
> https://sashiko.dev/
> 
> Fixes: 634fe5033951 ("[media] airspy: AirSpy SDR driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Valery Borovsky <vebohr@gmail.com>
> ---
>  drivers/media/usb/airspy/airspy.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
> index 8f6b721ba107..50db02d35213 100644
> --- a/drivers/media/usb/airspy/airspy.c
> +++ b/drivers/media/usb/airspy/airspy.c
> @@ -584,12 +584,14 @@ static void airspy_stop_streaming(struct vb2_queue *vq)
>  
>  	mutex_lock(&s->v4l2_lock);
>  
> -	/* stop hardware streaming */
> -	airspy_ctrl_msg(s, CMD_RECEIVER_MODE, 0, 0, NULL, 0);
> +	if (s->udev) {
> +		/* stop hardware streaming */
> +		airspy_ctrl_msg(s, CMD_RECEIVER_MODE, 0, 0, NULL, 0);
>  
> -	airspy_kill_urbs(s);
> -	airspy_free_urbs(s);
> -	airspy_free_stream_bufs(s);
> +		airspy_kill_urbs(s);
> +		airspy_free_urbs(s);
> +		airspy_free_stream_bufs(s);
> +	}
>  
>  	airspy_cleanup_queued_bufs(s);
>  

Here too it is better to replace video_unregister_device(&dev->vdev);
by vb2_video_unregister_device(&dev->vdev);

Similar to what I suggested for rtl2832_sdr.

Regards,

	Hans
