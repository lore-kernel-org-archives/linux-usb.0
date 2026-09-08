Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A69330656
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 01:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830432; cv=none; b=rcpR+W7T97GSWektdwgnGwsDiTWOXltF7BSQkqKH2IQmOz4GvsGVg+/mxdUVUUphxucBQ7uOimrR5JPFNQBotLiKkX0cAPdbvzWx9w5FP7iSxQ2X+omT2Ax58fSic+sl45ODwMMQ84IoxKdIDvTCiLByTPeen+2YAPKv+f6wHH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830432; c=relaxed/simple;
	bh=KvGX+44SPYr6D8qIe1uXj80+DgpAoZqDnGfB0H8zb1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bT/CYBnAMgfuqBLdz3+t7ywT8oXNyMccgY4QuWIAYElNAlSSmPC6oKo3J/AJziyA8q2hFywIv1ftYuaDvy1bS1de7NjmFKTQivzFmiF3uTXJqQkKHnF1GwM8YN53rep0vZNP0bX+tRN/n63UXcsSWDTUWaUOjp6hLAJiGRf29GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=OYenKvK+; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="OYenKvK+"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90cc39e06bdso49560986d6.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 18:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788830420; x=1789435220; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3fyMVY+2XETzDWaOQjFfSXpsUHtwGfs1gS31f7gitpY=;
        b=OYenKvK+eWtQM9po1yMAY19A6tXFHHJEi6uAS1XRGV4mUHaSBnWMJvgyO04nvJrtTD
         wxDvmZcN8DlzfyomJb3YUePSjhPtMOLrsplDdwSGteY6LKjI5agBcX/9cN1pULd7oyhm
         Ek1Lkidd+aud1rZIwHGGnEovN7u+ry8ZXKykSvdOHgWbn4OQy8tEoL/PWC3GXI4yuimb
         H5XV5Nx9nQ//5Ms71sWFCK3vDljdyclwL6kjXkEBYGyB/ttTE6w98ERRMqvE2gziVIjw
         MOGeuzc580cqHqtwsIpXUVfvlLYgU+dnn7+iUOnB02NV73NAQEBzd+kpbDzNdBHeUvtu
         0bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830420; x=1789435220;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3fyMVY+2XETzDWaOQjFfSXpsUHtwGfs1gS31f7gitpY=;
        b=BYFGV2qr1vEBhZZDc0Wh5Lah81uCByxHI+2/bI2HRwOHKn5v35EdDI27hKWEcVsQsU
         KpKXpLwKDpKU4abSpJDo7YUTel7bPr7pMLtUzF0WjLDRMtxmHWeG+VifniOymW0DjHLg
         1qQyM3xMWHX3rOoyP54yGj8Wsl2FlXMRP+VxVc+u4DlGSI/H0nl9Fta6mfw0MMqB29Jx
         Orb+/J+BpTMKV1FdxvmEn2xmjYwoGVkTFbG4lijFJTEVVtLAUk68LTZifzob7yN10lCn
         Y75QEafzegjPip4hF/RKSvLwTY4UxipmMcsuAALFlic8hnNl+6G2RaPeU5JamUM+Kk4H
         02KQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5LpTgjc8Y/94pdt5ixkLJVWhFUM44EeSKDIRyjI+4rWfzLqxW6VUutP1vGHANX7DixdLAeWpSy98=@vger.kernel.org
X-Gm-Message-State: AFuF++nGqEBfwMaOfJAXG+PSbb1WeZvKooTyOc+OFLkyM5EDwaxGnJtf
	52bjNz8Rcbja7N/jzn04jyTkq7xWFURzlQfUCHdtRD/b5GhmYeed1aLIvRtOZif2Hg==
X-Gm-Gg: AYBFou25rAtCbYhBrQ4vMx00zuJouhJ+4TH9Su4s7Jx8Nb0DfMqecdIJiWr7DYxnALn
	7z/90RjSNw8Xn/7JM9mnZTJITteSz0rnYLGDoEBZ/USamC2LUoaX/zXY93KFNjwRVTguS5U4WVb
	YsMpNJyfkAoSur0Zmps6oNlsVVbsb9E8H5VAtblv4DDEvWcCcozsgEaLOq/csM4gNf52cE8InpM
	PaHOdot+15tp6LIq7p9+8UyMvA+xxxyAtnKo+GMoATJATgJZr6FqTuG10dSMgIYAumPxXYGCYgh
	bUkQlVCfywIbuBgi2doxQ1hMfg93ZDEWL9sjg1dwxktxEGRGtbEvMY7tZXHqwgiL4/L+G0UAoRd
	eNQSVyrJrWcloEtgLdq7hk+C3CwW0SzNnJNkeaHqR6XNNLKlkzT0GHJ0XivMS4Xf9zMCJ020p6Z
	9A7BWHJNywRdWhP/dgTa+gytd2aQQikH0CD7LUGo8A6yDWyYYOx255t6EF8DIf1RE=
X-Received: by 2002:a05:6214:4905:b0:90e:7e02:cc3f with SMTP id 6a1803df08f44-9103ef88dddmr126267776d6.18.1788830420097;
        Mon, 07 Sep 2026 18:20:20 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104049d30asm105322846d6.0.2026.09.07.18.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:20:19 -0700 (PDT)
Date: Mon, 7 Sep 2026 21:20:17 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	linux-scsi@vger.kernel.org, linux-ide@vger.kernel.org,
	Niklas Cassel <cassel@kernel.org>, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH v5 35/40] usb: storage: use 16-bits defined sense codes
Message-ID: <c4dc659e-8292-4702-8d03-933b9500430c@rowland.harvard.edu>
References: <20260907024343.1046387-1-dlemoal@kernel.org>
 <20260907024343.1046387-36-dlemoal@kernel.org>
 <fbbde389-d040-405b-8f87-f589c4890afe@wdc.com>
 <f65388b1-e299-4f1f-927e-445f6d9e77df@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f65388b1-e299-4f1f-927e-445f6d9e77df@kernel.org>

On Tue, Sep 08, 2026 at 09:27:30AM +0900, Damien Le Moal wrote:
> On 9/8/26 01:13, Johannes Thumshirn wrote:
> > On 9/7/26 4:43 AM, Damien Le Moal wrote:
> >> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/
> >> gadget/function/f_mass_storage.c
> >> index a50743caf083..05e138968389 100644
> >> --- a/drivers/usb/gadget/function/f_mass_storage.c
> >> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> >> @@ -1103,9 +1103,9 @@ static int do_request_sense(struct fsg_common *common,
> >> struct fsg_buffhd *bh)
> >>        * FSG normally uses option a); enable this code to use option b).
> >>        */
> >>   #if 0
> >> -    if (curlun && curlun->unit_attention_data != SS_NO_SENSE) {
> >> +    if (curlun && curlun->unit_attention_data != NO_SENSE) {
> >>           curlun->sense_data = curlun->unit_attention_data;
> >> -        curlun->unit_attention_data = SS_NO_SENSE;
> >> +        curlun->unit_attention_data = NO_SENSE;
> >>       }
> >>   #endif
> > 
> > No sure how relevant it is to change something in a commented out block.
> > Wouldn't it be better to just remove the block?
> 
> Well, I don't really know why that block is here. Might be for some quick debug
> thing, so I left it, but made sure it is also corrected so that if the #if 0 is
> changed to #if 1, it still compiles.
> 
> I will let the cleanup of this, if any is needed, to the USB folks.

That block was created as a way of documenting the choice I made and how 
it could easily be changed, if needed.  Your change is fine.

Alan Stern
