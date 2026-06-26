Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4370A38AC80
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 18:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782499769; cv=none; b=oChvwl90v9wxluI9lphK9V5zQwcMXJegv7sGM8HFE0fGEMSzGh43kKcgp9D4dfjMg8nKIEtxPZ6agUrkYQlwn5we2eDC7+5aR2ysyQtAfBnHMuEA06EiiTH6qCBF2lkYj9BKH+e4mNUVQ894O9Ge8ls+BebavyF8DaafQdFwsmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782499769; c=relaxed/simple;
	bh=WdQn7ZxlwVSwEkRpRMyk7ZVypiug2xjkELicFBqpHrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRb+lZXN862evBdx7+7Wa6eqYt78edttJplXNHZyl1eDdZyq0iNSbt4imfFbNlv1w91CZZlZF1LmepFfBEuX/uMlOlHAgey6Rj1MuGGJLDDbW+8KXKHP1VHlLI5QJJUeMfbYUNdFjRiUrSYKrqIsVe9nttMjdl47XqLjbKpY7Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ps2hJqnK; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ps2hJqnK"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8e855bb8216so7536256d6.3
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 11:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782499766; x=1783104566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d74Wj9KlK+DdwUy/vFvxXnQUACrpg/th02DaCorHY/0=;
        b=ps2hJqnK25tZ3xanuuPsI7X/HChMmMQsxlqZQxJhPCXvHA66XWGAuzXQp+zi/FhWCS
         zkDotzFUxY0BAxJz9uFG1cvwARriEIDujIdv5AOLSQCFRdrudZqqHDqmx5ki6nMiDnNP
         VNTZBbRIFJOKE88jO0ON6dr2bNTmevB+xErUTgPiXVkl5jKJPM/eXU6fClZucIa/r4hy
         hLSfAMhhzhWRchLTQw7nkKJj7Rw9JfuIrVb8QydqhNS67KdFoy3gjWYRVtEOyZr+DzTF
         z2xx53VUnpUm66Xqx0rL1s/1bjWCmy6+hipUqX9AW1VtGE4t0yVw1o2VLcuHh/bu4+Kr
         9jYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782499766; x=1783104566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d74Wj9KlK+DdwUy/vFvxXnQUACrpg/th02DaCorHY/0=;
        b=sqo6BQ+3OmmIiBUl4Z/ClxkUfqt10M84khn+7ikJLQxfZy3OWaYhc/h1VBnruNgSWS
         j9ubAuVVoYSDyYO4aGcetZN0y4mifIaq4FYTr1t8r+hQe5E4PYMnpAcgOiBJK4uGW4ns
         JgZsbIg/qxlWuYUzqqk8qhl0Mbd439PGHI7vGgHoHCK/uH2o5Y4WgY04Aj6aXNDLaP5E
         vXpNHUTwQBQ5npMri3U6oGV5sZsCUeYuJp/tc7OGigN2zlr8ryFrqwyCwusCoHytjTad
         kOyHKmCKhUF1uKH/PKYNs3YGYSsFG1Y3VIu3XS40p9DAdWQiU5mu6SBxKf1mmDQ+fx7z
         s6qQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdVAaaWYSCrCbeYIZ+1DN7XuwYnx4UuD7LgkwJ8lV0hAcB3fz15iREApiZf+pxbaTUmZ5kBLtL3pA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7/DpEvj2mcPdPcY++hDxyJys5K5QQowafxYUKJB4+F5Z6n2XD
	+GH/8ZekW+gm5UjsY4XWi0jdhAnT9mUHaBAphlQIJFUEiQYd2UVfgE+sUFC5/Sw+PiUSCsi73j8
	G9L1/IQ==
X-Gm-Gg: AfdE7cnAKEU5RH3Z2q9PKV1eL6FLPxiMdOBhRbFIdVMeCrr1XvCoxHDWECwLO9IHi2l
	acpE2K3mzpsA5qy/As8SSO+FZQj/2dZeJr9oI8UaFzlFQBy0SVOvR7P7lJEDgrFk4NxY8jquiFh
	a+GHL61OBnEc6oMkGVLkCSgXjYRllwIWeX7Wjfib/YnicRzxmXORaJVLdgkWBRM0PuO/BYdUJZY
	JX8N5AjGfFKRc/HsIcDHkGxrIWnPTu5tr/ZF2J94MFi0q0ZSW22KfRooOe/+w188X0Ev54vvgQk
	qEmNx9zNhEy7E7ag15I6cRZfbyNbQX07pEFrJUnwas9LyRr5GXlR341edipfmoK4SIGGt4NxDW0
	BwNKDF03lmloYpoBB+9sQp3NyHh9WOuBCnlN4CKoAhZ0KuuW7QZOlrrMofIy88OksTtE0KzM5lb
	ibpqlO4uUt6uH2qnxX8GAzM9tBEbbs0JfX
X-Received: by 2002:a05:6214:f25:b0:8e0:c7de:1a2e with SMTP id 6a1803df08f44-8e6d2cdb818mr141380256d6.0.1782499766035;
        Fri, 26 Jun 2026 11:49:26 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df82c62eedsm225409556d6.47.2026.06.26.11.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:49:25 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:49:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: raoxu <raoxu@uniontech.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [usb-storage] [PATCH] USB: usb-storage: ene_ub6250: restore
 media-ready check
Message-ID: <387c7948-fcfe-4802-8696-51c45d7d2dcf@rowland.harvard.edu>
References: <F42641386E32404F+20260626070607.4119527-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F42641386E32404F+20260626070607.4119527-1-raoxu@uniontech.com>

On Fri, Jun 26, 2026 at 03:06:07PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> Commit 1892bf90677a ("USB: usb-storage: Fix use of bitfields for
> hardware data in ene_ub6250.c") converted the media status fields from
> bitfields to bit masks.
> 
> The original ene_transport() test called ene_init() only when neither
> media type was ready:
> 
>         !(sd_ready || ms_ready)
> 
> The converted test became:
> 
>         !sd_ready || ms_ready
> 
> This is not equivalent. Restore the original semantics by testing that
> both ready bits are clear before calling ene_init().
> 
> Fixes: 1892bf90677a ("USB: usb-storage: Fix use of bitfields for hardware data in ene_ub6250.c")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>  drivers/usb/storage/ene_ub6250.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
> index 8770de01a384..ed49a3bc859c 100644
> --- a/drivers/usb/storage/ene_ub6250.c
> +++ b/drivers/usb/storage/ene_ub6250.c
> @@ -2305,7 +2305,8 @@ static int ene_transport(struct scsi_cmnd *srb, struct us_data *us)
> 
>  	/*US_DEBUG(usb_stor_show_command(us, srb)); */
>  	scsi_set_resid(srb, 0);
> -	if (unlikely(!(info->SD_Status & SD_Ready) || (info->MS_Status & MS_Ready)))
> +	if (unlikely(!(info->SD_Status & SD_Ready) &&
> +		     !(info->MS_Status & MS_Ready)))
>  		result = ene_init(us);
>  	if (result == USB_STOR_XFER_GOOD) {
>  		result = USB_STOR_TRANSPORT_ERROR;

Thanks for fixing this.

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

How on earth did you find the error?  It doesn't exactly spring to the 
eye.

Alan Stern
