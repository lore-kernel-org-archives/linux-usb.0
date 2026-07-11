Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E752A287247
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783783470; cv=none; b=DBcaBdhqq2RIQja3sWuZUtcWydGBDZXPzcRvMI3QZkzzmrF0IN/YshTQ/tRApmuAlU3AE3+I4oxcfZxF9SwW9OZCJEUDEw7gqhfSXy/mOcvBMW7V0a5vuo++4GefuyJ+5B5x21lKU1IgkRC74Apew7ywCP0ltzdl7EYMsqSAuJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783783470; c=relaxed/simple;
	bh=Kic3KmEjn9ygvkuMEu0MppO1u/79HhPiMsZyt12FFqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6l6emqWfB+p5j2zt/2WIfAkKrelbmne4EUXsQnCH5KG6fKs/MogCfbNTOnN198AWFd6g9p3N/tfbK17UxNkfLEkz/f1NFCDQdnM0hyAoCJoJ9Ep68yUicFrIImRdID2DDWqDRagFYjS43yxLII2h0u9tXiNXoGqupXWKUxFaB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=Fu+KR+wx; arc=none smtp.client-ip=212.77.101.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="Fu+KR+wx"
Received: (wp-smtpd smtp.wp.pl 30461 invoked from network); 11 Jul 2026 17:17:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1783783065; bh=tbkKpgjgO3zr63iTTMxUAwOMBNwmIkPTt0PTg9gyFUA=;
          h=From:To:Cc:Subject;
          b=Fu+KR+wxJ9GV7O1J9U8xTZpbPHtQE4nbRYzzJfkiZGv/7QPaMM/rGs/WCsq6edhbM
           HsbJWQFKy5oHTgGSbbHUv79LC40ODuYv0Dus/mkQ2LHC0fAu6ISOI2zlU5NEtSnIl1
           O1FOtcZcjlYwaUx1ZqqljsUuqzQT9oLZ3q70vD3qZT10Hj0SybdRKpOwbwi/dOC3vE
           YoDXn6MKerJJAipGDADiP57zLTFumAj+MXn9qWbLFcKKMNpTxC+lB74lM7aA60nPSn
           LLIymVBRbBCX0H+9r6ngyb3PUY1dT952wnlQPYEEGR/ed79IsnzYVnbXTq8sea/RHY
           RBFjT6zwFz6rA==
Received: from 77-236-11-215.static.play.pl (HELO localhost) (stf_xl@wp.pl@[77.236.11.215])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <ceohunk@gmail.com>; 11 Jul 2026 17:17:45 +0200
Date: Sat, 11 Jul 2026 17:17:44 +0200
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: Yuhong Cheng <ceohunk@gmail.com>
Cc: castet.matthieu@free.fr, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+123456@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: atm: ueagle-atm: fix use-after-free in
 uea_upload_pre_firmware
Message-ID: <20260711151744.GA8759@wp.pl>
References: <20260711144259.1124-1-ceohunk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711144259.1124-1-ceohunk@gmail.com>
X-WP-MailID: 1c4b3b62958228ece1a52e612d449f77
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [EdOR]                               

Hi,

On Sat, Jul 11, 2026 at 10:42:59PM +0800, Yuhong Cheng wrote:
> syzbot reported a slab-use-after-free read in uea_upload_pre_firmware. This is because the usb_device is passed as context to request_firmware_nowait but its reference count is not incremented. Thus, if the USB device is disconnected before the firmware load completes, the callback accesses a freed usb_device.

I think this not true, please see:
https://lore.kernel.org/linux-usb/20260702093707.GA6804@wp.pl/

Regards
Stanislaw

> Fix this by taking a reference with usb_get_dev() before calling request_firmware_nowait() and releasing it with usb_put_dev() in the completion callback or if the request fails to start.
> 
> Reported-by: syzbot+123456@syzkaller.appspotmail.com
> ---
>  drivers/usb/atm/ueagle-atm.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
> index d610cdcef..eaf2f2d3a 100644
> --- a/drivers/usb/atm/ueagle-atm.c
> +++ b/drivers/usb/atm/ueagle-atm.c
> @@ -663,6 +663,7 @@ static void uea_upload_pre_firmware(const struct firmware *fw_entry,
>  	uea_err(usb, "firmware is corrupted\n");
>  err:
>  	release_firmware(fw_entry);
> +	usb_put_dev(usb);
>  }
>  
>  /*
> @@ -693,13 +694,16 @@ static int uea_load_firmware(struct usb_device *usb, unsigned int ver)
>  		break;
>  	}
>  
> +	usb_get_dev(usb);
>  	ret = request_firmware_nowait(THIS_MODULE, 1, fw_name, &usb->dev,
>  					GFP_KERNEL, usb,
>  					uea_upload_pre_firmware);
> -	if (ret)
> +	if (ret) {
>  		uea_err(usb, "firmware %s is not available\n", fw_name);
> -	else
> +		usb_put_dev(usb);
> +	} else {
>  		uea_info(usb, "loading firmware %s\n", fw_name);
> +	}
>  
>  	return ret;
>  }
> -- 
> 2.46.0.windows.1
> 
