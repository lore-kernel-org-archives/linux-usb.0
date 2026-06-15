Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8196F3B47E5;
	Mon, 15 Jun 2026 07:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506819; cv=none; b=B5LeK+nYumE7wv+fmCnTRNeSs627x2wRzscYTJPnJgl8oSaA30H+YVinMAk+yQxjlqHE6Wb9iv5bGqYoXwgadxUYxOlNUDyLBjGzvpF6i16NxTQy0Z5L1huzTy6jz0nW3wPtqe8ecwexrbPkuk+Y+LnET+9GPlFRkt2MfcV6hLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506819; c=relaxed/simple;
	bh=rXy20V8HoB3SYj48CLpUdIXht9pLv0W2d/Rzsw9tGkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnV4L29fRNU7o1sYNzODoYUXnca/jYDXKT1EyR+QqiFeUwQ50okQMwVvA0e1aoAPNJba7nDa/O+N/0EWjR9hJBnwLhr40IosXnI+64T86HVTQQCEzgAfznKCDzDLenD6iilFElZU/80OAWOMLUaQzDWd9BCjWl+BPMdaFk1QXQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ECGHmZEM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ECGHmZEM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EDE1F000E9;
	Mon, 15 Jun 2026 06:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781506818;
	bh=jnYV5ZyUmBoh0Lr1eFTQxu4+9tR8ELSGKkbyVWwnIZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ECGHmZEMptqTI7O6sC4HUzQUBNQFd/BuWt7RC7SkKaUEKYiwLphsi6j6VWs+UfDBu
	 HDywvjk8rKgFKbe5mab590+NRR4vN7F1O0O7hwDXS3NTKGVoEl86pd0+qWQJ9U9Vu1
	 6PWydypvlQ+6lHPmigzuq9hDArGLgoFVxASQGfgg=
Date: Mon, 15 Jun 2026 08:58:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: gaokun: unwind notifier on UCSI
 register failure
Message-ID: <2026061504-trowel-hefty-41ae@gregkh>
References: <20260615065358.93104-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615065358.93104-1-pengpeng@iscas.ac.cn>

On Mon, Jun 15, 2026 at 02:53:57PM +0800, Pengpeng Hou wrote:
> gaokun_ucsi_register_worker() registers the EC notifier before
> registering the UCSI device.
> 
> If ucsi_register() fails, the worker only reports the error and leaves
> the notifier registered.  Later EC events can then call back into an
> unregistered UCSI instance.  The remove path also unconditionally
> unregisters both the notifier and UCSI device even when the delayed
> worker failed part way through registration.
> 
> Track which publication steps succeeded, unregister the EC notifier when
> UCSI registration fails, and make remove only undo the steps that were
> actually published.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> index ca749fde49bd..29d2e76b2fe9 100644
> --- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> +++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> @@ -98,6 +98,8 @@ struct gaokun_ucsi {
>  	struct device *dev;
>  	struct delayed_work work;
>  	struct notifier_block nb;
> +	bool notifier_registered;
> +	bool ucsi_registered;
>  	u16 version;
>  	u8 num_ports;
>  };
> @@ -457,10 +459,16 @@ static void gaokun_ucsi_register_worker(struct work_struct *work)
>  		dev_err_probe(ucsi->dev, ret, "notifier register failed\n");
>  		return;
>  	}
> +	uec->notifier_registered = true;
>  
>  	ret = ucsi_register(ucsi);
> -	if (ret)
> +	if (ret) {
>  		dev_err_probe(ucsi->dev, ret, "ucsi register failed\n");
> +		gaokun_ec_unregister_notify(uec->ec, &uec->nb);
> +		uec->notifier_registered = false;

Why this convulted logic of setting to true and then false?  Did you
have an AI write this?

And why are 2 flags needed?  Are you sure that's necessary?

How was this tested?

thanks,

greg k-h
