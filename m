Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162931;
	b=jenJ8tYF+3WseRDU6RxGqxxA65bMXk4FNkMRzeV/qEVWHoRT4qSyha/ZMZJuBv+ZoFrM
	 DCRxEzp32rMnM+07kN8eXdyfAxkm297+uUf6NQe0V+JhkzKyc2kVKWOMszuYPRfOW/kUK
	 1rx84oQ65+CXUUM8N857BcpelJra9gSgT50WCBd77TjeyQDMLnX4VIlOgiOv3om7sRkAy
	 SqNCZ/BA7LeqKGqODhKYgwR5URAeYMGGdIMFhMefP2wHR/GJL+jw3mxgqGf4tVOODEss4
	 HXD/u5C5CMYnseNRFbI68L16xJy4C8QDncOQwNWoVobQ2cb95FzU89zU3jGLCilpnwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162931;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hlHhW5pk9GrumZeLz0ObcW5J/DYuHFwyy9FiwFx3O5Y=;
	b=gT4XTB1fxySYsvJ/m+cabJrDTvCMvaYNBedmI5kOC6JJ3I57azYShnvlW5R+29l0YX9A
	 4hwKYZiREoaX4CRJLwLyQN8qbWT6A7Yf+htro+DD7N5cS5ERDC0qx5uHCjBEKrO8/yk1W
	 19Wzmvd4JuIpI84Y445k8o5b92sM72A6y/A+UvJ9UYv9fIavnf3iXHNUGk0BdH8xwP2CD
	 KZix6yU99ixLkrwl5fQza8CuZcHv+io7W0l4Z8NtZxORnNTEyh1s3TnKfy93v912ssyU0
	 fwl2VVhSub7u+HYqbV10gbfmM2x89DDGSxK6kF7m+6Pz8scnEf0VWGtrAo3x1Y1VdVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=cIho2aCO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FEF606A320;
	Fri, 20 Nov 2026 08:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=cIho2aCO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0291F000D0;
	Fri, 20 Nov 2026 08:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795162931;
	bh=hlHhW5pk9GrumZeLz0ObcW5J/DYuHFwyy9FiwFx3O5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cIho2aCO27eNoy+3ldeTI6I4FaJGG0fBgmCNfal+lv9PG0+M+YwXZU1U7LcuVWzQ7
	 uHwQDvP8p1dyqM2vraeGwqS6dGcp1X3IPIb5cxS3nr8h2Y9isWc1vSoC3W3wTDE7Mg
	 wFfmVFjuVurubeMs2R/XTxfF9nYZznqWNlb4iwJs=
Date: Fri, 20 Nov 2026 09:22:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Saad Varshani <varshanisaad@gmail.com>
Cc: nkapron@google.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: uvc: Fix deadlock in
 uvcg_extension_bm_controls_store
Message-ID: <2026112055-squire-strongly-aee9@gregkh>
References: <20261105053900.20082-1-varshanisaad@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105053900.20082-1-varshanisaad@gmail.com>

On Wed, Nov 04, 2026 at 09:39:00PM -0800, Saad Varshani wrote:
> Removed su_mutex locking in the function uvcg_extension_bm_controls_store.
> Done this due to the deadlock caused by the mutex conflict in
> fs/configfs_write_iter. Validated commit with the C repro provided by
> syzbot.No other conficts observed.
> 
> Reported-by: syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=300213c2b5b55c0244f4
> Signed-off-by: Saad Varshani <varshanisaad@gmail.com>
> ---
>  drivers/usb/gadget/function/uvc_configfs.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 70a1415ea401..78588366f656 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -1114,16 +1114,12 @@ static ssize_t uvcg_extension_bm_controls_show(struct config_item *item,
>  static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
>  						const char *page, size_t len)
>  {
> -	struct config_group *group = to_config_group(item->ci_parent);
> -	struct mutex *su_mutex = &group->cg_subsys->su_mutex;

Should be done for all functions, not just one, right?

thanks,

greg k-h
