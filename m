Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA052941A;
	Sat,  8 Aug 2026 07:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786173120; cv=none; b=QJBfa3bqVD4SUZ7W1zopaTEyyFtP5i8MwB8TQKHSspo13ZQL0GjO5o9epBcL9s7IkfB+jJ4k8fSbckFfBZxe+M52wftift3EeFGO7fnD1WDMmBvcPUAeFRaAkpdtfjf9k3+rxKVGRbxPjDRbTOcXerUf7F7dur8SOCajgfD4lcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786173120; c=relaxed/simple;
	bh=Y3p+uxfnkd9jFBNazJKewzAI7z2k3ogdPN46d4RLNwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXP2aXWDxnLDQhi1pI8czi3PO/hIBlFdlMc7M3b/RAqfZwl+CLt0y2K07MvzkD/CuBujxJIDsf0nWr/o2kBDqK/o/0aEhSa6CRHJPkfRQN917Mn4UrAwop/1hao1f9ZiNlyvpTxCow7EWzHfm5q5sVl8Hj+YbRhR3qM6UwmztLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=txJQj/ZC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="txJQj/ZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B101F000E9;
	Sat,  8 Aug 2026 07:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786173118;
	bh=sBAR4sRcRDC+0m78UDCnOIdXECY6rjt8APDbPMzB+KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=txJQj/ZC33Z2yw6ZVs9nnWi/t8ct5pT7CET8kU2c+hsj9ZgoCEp9NXDusGjo45vjl
	 +TOoaOm17Sz1aeglkqPj30gUbGEqWcuFpb9CdDts1WRGyl01s5RZC1ZIA/P20Ab9ru
	 VEXb1Lkpw/56V2xqko7qnB2x32ESxnThMr4OWo1A=
Date: Sat, 8 Aug 2026 09:10:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: heikki.krogerus@linux.intel.com, sebastian.reichel@collabora.com,
	tglx@kernel.org, alchark@flipper.net, u.kleine-koenig@baylibre.com,
	ustc.gu@gmail.com, bigeasy@linutronix.de, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: fusb302: Free log buffers on exit
Message-ID: <2026080802-finicky-exclaim-0def@gregkh>
References: <20260807203403.1011343-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807203403.1011343-1-dbgh9129@gmail.com>

On Fri, Aug 07, 2026 at 04:34:03PM -0400, Yuho Choi wrote:
> fusb302_log() lazily allocates entries in chip->logbuffer[], but
> fusb302_debugfs_exit() only removes the debugfs directory. The buffers are
> not part of the devm-managed chip allocation, so they leak when the driver
> is removed or probe fails after logging.
> 
> Free all log buffer entries during debugfs teardown.
> 
> Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip driver")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
>  drivers/usb/typec/tcpm/fusb302.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 3319f6a2b0c9..67ccbbd64caf 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -223,7 +223,16 @@ static void fusb302_debugfs_init(struct fusb302_chip *chip)
>  
>  static void fusb302_debugfs_exit(struct fusb302_chip *chip)
>  {
> +	int i;
> +
>  	debugfs_remove(chip->dentry);
> +
> +	mutex_lock(&chip->logbuffer_lock);
> +	for (i = 0; i < LOG_BUFFER_ENTRIES; i++) {
> +		kfree(chip->logbuffer[i]);
> +		chip->logbuffer[i] = NULL;
> +	}
> +	mutex_unlock(&chip->logbuffer_lock);

As you are tearing things down here, and there is no actual user, why is
the lock needed?  And if so, can you just use a guard() instead?

thanks,

greg k-h
