Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B8D31355C;
	Wed,  8 Jul 2026 05:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783487575; cv=none; b=TQ/kyzrtAkhh47dCYOZtCxZLAey1gXNBfA6thqKs9TvRh444wqds71zf89q9tKnIaOWMcwsUcb0dolSi/4XbqaNyCe4rnwNUIphZj+UfcUtRlmKbjYO/Opcg7gk9b46rp+IoXpN+IzAb1H022Usp5GjQOleLcguF/Jmm1SLWj/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783487575; c=relaxed/simple;
	bh=eIeqmnPDYu8plUPapUApW5CqFRubZXkkAqOyKQUe8qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5vLaj28iZjHXBqskM2q3zPctYnCFimaSq9FPzw6U96f2pASimlAFqa6CswqwD2jWR9XZwsxezIfIJhCJzp73vnhsJ6gDJc09PNZ2M5z4AWESthGT4pxgsCQ9yLqCzzS3VukPhCSr/irI6HLbzd2yeGNWrC9OEVwVCWVD/FucfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LefVP+9Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LefVP+9Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D011F000E9;
	Wed,  8 Jul 2026 05:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783487573;
	bh=IktndhyEM2zMAMvJvxdpU4chNCIr+yce4RIIREcxpMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LefVP+9YzZrcqwObsk30UpVSV/9UdxA+uwSm50wTD+9BJXcexk6EPHl7+fwM0Uw+k
	 GTl5p1jAJeccl1VTfRXJf6taIqnEe2H1/yq8T7Z95vZfNN+Yxa9jU+3nOUW/bJ27wm
	 q+6XEC8UVZ8tzWTaFXFWV+KRZRxc78eZjKU6oOBM=
Date: Wed, 8 Jul 2026 07:09:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: recover from silent PPM completion
 in sync_control
Message-ID: <2026070850-studied-dash-42e2@gregkh>
References: <2026061632-gleaming-resend-9a5f@gregkh>
 <20260708022420.3914391-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708022420.3914391-1-acelan.kao@canonical.com>

On Wed, Jul 08, 2026 at 10:24:20AM +0800, AceLan Kao wrote:
> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
> 
> Some firmware completes UCSI commands and sets COMMAND_COMPLETE (or
> ACK_COMPLETE for ACK_CC_CI) in CCI but never fires the ACPI notify that
> would wake ucsi_sync_control_common().  The driver then times out after
> 5 seconds and returns -ETIMEDOUT, even though the EC finished the command
> successfully.
> 
> Fix this by polling CCI once via poll_cci() on timeout.  If the relevant
> completion bit is already set, the EC finished silently; fall through to
> out_clear_bit so the normal read_cci()/read_message_in() path retrieves
> the data and ucsi_run_command() issues ACK_CC_CI as usual.  Only return
> -ETIMEDOUT when the EC has genuinely not completed the command.
> 
> Guard the poll_cci() call with a NULL check: if a backend does not
> provide the op, skip the poll and keep reporting -ETIMEDOUT rather than
> dereferencing a NULL function pointer.
> 
> Fixes: 584e8df58942 ("usb: typec: ucsi: extract common code for command handling")
> Cc: <stable@vger.kernel.org> # 6.14+
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> 
> ---
> v1 -> v2:
> - Add Cc: <stable@vger.kernel.org> # 6.14+ as flagged by Greg's patch bot:
>   the Fixes: tag targets a commit already in released kernels, so the fix
>   must be nominated for stable.  Scoped to 6.14+ because poll_cci only
>   exists from that release (absent in 6.11-6.13).
> - Guard the poll_cci() call with a NULL check to avoid dereferencing a
>   NULL function pointer when a backend does not provide the op.



> ---
>  drivers/usb/typec/ucsi/ucsi.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 9eeb38e7472c..deda7123b5d1 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -91,8 +91,29 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
>  	if (ret)
>  		goto out_clear_bit;
>  
> -	if (!wait_for_completion_timeout(&ucsi->complete, 5 * HZ))
> -		ret = -ETIMEDOUT;
> +	if (!wait_for_completion_timeout(&ucsi->complete, 5 * HZ)) {
> +		u32 polled_cci = 0;
> +
> +		/*
> +		 * Notification from EC did not arrive.  Poll once to check
> +		 * whether the PPM actually finished without firing a notify.
> +		 * If poll_cci() is missing or fails, polled_cci stays 0 and we
> +		 * correctly report -ETIMEDOUT below.
> +		 */
> +		if (ucsi->ops->poll_cci)
> +			ucsi->ops->poll_cci(ucsi, &polled_cci);
> +
> +		if ((ack && (polled_cci & UCSI_CCI_ACK_COMPLETE)) ||
> +		    (!ack && (polled_cci & UCSI_CCI_COMMAND_COMPLETE))) {
> +			/*
> +			 * EC completed the command silently.  Proceed to
> +			 * out_clear_bit which reads CCI+data normally, and
> +			 * ucsi_run_command() will issue ACK_CC_CI as usual.
> +			 */
> +		} else {
> +			ret = -ETIMEDOUT;
> +		}

This is an odd way to write an if () statement, why not reverse it so
that there is no need for an else {} at all?

thanks,

greg k-h
