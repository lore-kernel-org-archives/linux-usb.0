Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A08289E13
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 15:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275405; cv=none; b=ZOFcUKmgl/C/n6sT1HboQZArmHyo+11M3/ysbVC6M7LkOAKEJO9hlyPaY8+cdFYxLveQSW5WAJngg30ukSxE76Fbp63ijlHWZk691MA3BCOfSQPbyTpdZ7Kvao7ccA2XWKT52SqUQht43mofNRU4OZKJlRrQ7gTyQnJN+E3D3NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275405; c=relaxed/simple;
	bh=XDtZIYgFaGlLg2NFBhBeeFbOO/ibE67RBceeimGekjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNU7p2Oqy3RZutcTKPi8Q+O+AKZD4U1n+s8JRdcQ/F5F0onmqDiQxonI9R/xO5mA82UhURUnOYRei6m8BOD112xPKLVoChcgVTnUqbbUJ2PQUhF+NgsCUlITgFdqJBRFgbV7KLoahfqnYa3txdC8K1RQ5SPfFPkQbwXJTTbuCe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Z1zuYMrt; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Z1zuYMrt"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c2a449c57so50476621cf.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 08:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788275402; x=1788880202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X6VIGdKbYA2/0wqS3bWVwr3PZ0jVydUW/eaQiKIrOxU=;
        b=Z1zuYMrtLINeeFmBah01l9TTZXrp4+/m1ON+JZ+f/r6NGX9gxwad9khHdJs2iI2R5U
         WGxN4DEGcJyYaQ2pGydRmqs/J9v1JQwYw3Iz349shCbcJEP3+HgGAIaorNB8vGvOdAGm
         8Iwlr0WjQ9eU6QrFGybTIvQ/EL2yomeEq8abOcsf5Yzdu+jLdXwu99BoKBdeTgDsPwy1
         /4N7hiURGTduwimVLND1pJaWjsojBqgh0oKlf3RVUdiixOKOJ4Ar1MiSZsw269zglypB
         xgBeTVyI/X0k7rFjNkdPkEXY6EqTSbqGz0oH09gYEl/G0ZSMcx1Bz3WKyECpBIYL85A7
         cveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275402; x=1788880202;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X6VIGdKbYA2/0wqS3bWVwr3PZ0jVydUW/eaQiKIrOxU=;
        b=UpnmK8F75vcBEYdFU5bOBwW09NpvxvISthkN7PqO+IiUwqNFddVMuYYE2kvsoW2nJ8
         5QDOAtH6yZQbKWDpTEsUNQOK4oWSbpszqhLXwKo8+Ou/3oxkKgdVI5yhuEVtzV0LZyQZ
         5t+CawMjtyafgtNM+7rrdTRrqbcOOtwhm5xUIJ8rn+efrbI9tBxyz0r4S35LBy0Ko6RN
         dw2Z4rwzi5H8Cz4DBAZJxYoodvvoNg8DEUsRpWPFwY+brmpbnH2JyTS1PpslFlmLzXXT
         CyBdA08Y54SmwLbReJH2J0z0GOO/GXgrPPb96LTGrjqEKbZSWcqZCX/6K7W6qyGuPgnq
         yzog==
X-Forwarded-Encrypted: i=1; AHgh+RrVdg2jj/HcFuHTJLC6g5r+vZS77eBpGL6gst1yq7IZcOt/XzuqIy1jmtnd3Zl2l/OP2mHBS4+dxkA=@vger.kernel.org
X-Gm-Message-State: AFuF++m7iER9Ave3aCS1/TsK4hSCJIlYuH88NRYyZJujj0RUjKNM0c9Z
	5FWet4IRlpZSH/nEr7lTgvXZ/qVfY6W4AACGyhr/uSm/wKW8Cxk0U9kzR48p9ga84ih9dnPuIt6
	Fbb3osA==
X-Gm-Gg: AR+sD12UH3gv0+fyLd2o3H3ATKgbXrc4fY0A5nv4mE9aRggCntw9iUWjDOuWnTqkgoc
	6+tcOSDAoCPM1ssjAWoeXaSEefcvEzxZ2p+BUYzix9rkCwP+4zJh3Hg04dgPgh3cYD2sEaCGvZ2
	msElMVC4t7N8sffZ6hRiYkOd5Kty0VfQGYKsEHEYkwoaIFeUXPU9Zg42RNDrOdipY1ChgyqXU5H
	qTWQ30l6l0AiqS543D6KkLGJg43GmjVcn7AL2RoEoVc1a/0hrUrasSROTR5C5Uck6zneVCNb/v4
	6cuuL7y5XS2ewZFqKPhrjzrY6E2Nim6WasuA5c3wbpJvtKixzQPG/odGo4AxxA1u1uml8HBDUi6
	RC+N+NYlaLyByQxaOy70XsCLyakH4KE5ANnfWdyCZtsFk4S8u0iPP+AFqy96Vg9wwSxV08fhimE
	ioq1jO8L/rSi/XEHT/4SwoESpvAS3z1ArhPOcON5kaerBmAe4gFf1PyAZmx76/Wg==
X-Received: by 2002:a05:622a:58c4:b0:51c:ba4:d837 with SMTP id d75a77b69052e-53021bc32aemr134564011cf.18.1788275402260;
        Tue, 01 Sep 2026 08:10:02 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe8511fasm95337331cf.28.2026.09.01.08.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:10:01 -0700 (PDT)
Date: Tue, 1 Sep 2026 11:09:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Aristo Chen <aristo.chen@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?J=F3_=C1gila?= Bitsch <jgilab@gmail.com>
Subject: Re: [PATCH v1 1/3] usb: gadget: configfs: fix WebUSB landing page
 missing NUL terminator
Message-ID: <dd6e778a-f33e-4c88-8ee8-3f86582d1439@rowland.harvard.edu>
References: <20260831154139.55811-1-aristo.chen@canonical.com>
 <20260831154139.55811-2-aristo.chen@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831154139.55811-2-aristo.chen@canonical.com>

On Mon, Aug 31, 2026 at 03:39:37PM +0000, Aristo Chen wrote:
> landing_page is sized WEBUSB_URL_RAW_MAX_LENGTH, which is exactly the
> length of the longest URL that can be represented in a WebUSB URL
> descriptor (U8_MAX - WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + 8 == 260),
> leaving no room for a NUL terminator.
> 
> webusb_landingPage_store() bounds the URL with
> 
> 	if (l > sizeof(gi->landing_page))
> 
> so l == 260 is accepted, and for a "https://" URL the second bound
> allows 260 as well.  memcpy_and_pad() degenerates to a plain memcpy()
> when dest_len == count, so nothing terminates the string:
> 
> 	printf '%s' "https://$(printf 'A%.0s' $(seq 252))" > webusb/landingPage
> 
> configfs runs store() once per write(), so the 260 bytes have to reach
> it in a single write to hit the case.
> 
> webusb_landingPage_show() then does sysfs_emit(page, "%s\n", ...), which
> reads past the end of the array.  What follows landing_page is the
> padding in front of the spinlock member, three bytes of it in the
> layout here, and kzalloc() left that padding zero, so the read stops
> there and the attribute happens to return exactly the bytes that were
> written.  The over-read is harmless today only by accident of the
> layout: the terminator is never written, and nothing keeps a new member
> or a different configuration from putting live data where the zeroed
> padding currently sits.
> 
> A 260 byte URL is legitimate: after stripping "https://" it yields a
> 252 byte URL descriptor payload, or bLength == U8_MAX exactly.  So
> rather than rejecting it, give the buffers room for the terminator and
> keep WEBUSB_URL_RAW_MAX_LENGTH as what its name says, a maximum URL
> length.  The explicit bound in webusb_landingPage_store() now uses that
> macro instead of sizeof(), since the buffer is deliberately one byte
> larger than the longest URL it may hold.
> 
> Fixes: 93c473948c58 ("usb: gadget: add WebUSB landing page support")
> Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
> ---

A somewhat verbose description, but okay.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/configfs.c | 6 +++---
>  include/linux/usb/composite.h | 2 +-
>  include/linux/usb/webusb.h    | 5 ++++-
>  3 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 51df6d1d1487..4bc95f4b6670 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -55,7 +55,7 @@ struct gadget_info {
>  	bool use_webusb;
>  	u16 bcd_webusb_version;
>  	u8 b_webusb_vendor_code;
> -	char landing_page[WEBUSB_URL_RAW_MAX_LENGTH];
> +	char landing_page[WEBUSB_URL_RAW_MAX_LENGTH + 1];
>  
>  	spinlock_t spinlock;
>  	bool unbind;
> @@ -1072,7 +1072,7 @@ static ssize_t webusb_landingPage_store(struct config_item *item, const char *pa
>  		++bytes_to_strip;
>  	}
>  
> -	if (l > sizeof(gi->landing_page)) {
> +	if (l > WEBUSB_URL_RAW_MAX_LENGTH) {
>  		pr_err("webusb: landingPage URL too long\n");
>  		return -EINVAL;
>  	}
> @@ -1742,7 +1742,7 @@ static int configfs_composite_bind(struct usb_gadget *gadget,
>  		cdev->use_webusb = true;
>  		cdev->bcd_webusb_version = gi->bcd_webusb_version;
>  		cdev->b_webusb_vendor_code = gi->b_webusb_vendor_code;
> -		memcpy(cdev->landing_page, gi->landing_page, WEBUSB_URL_RAW_MAX_LENGTH);
> +		memcpy(cdev->landing_page, gi->landing_page, sizeof(cdev->landing_page));
>  	}
>  
>  	if (gi->use_os_desc) {
> diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
> index c18041fafa52..0621a6a5cc57 100644
> --- a/include/linux/usb/composite.h
> +++ b/include/linux/usb/composite.h
> @@ -472,7 +472,7 @@ struct usb_composite_dev {
>  	/* WebUSB */
>  	u16				bcd_webusb_version;
>  	u8				b_webusb_vendor_code;
> -	char				landing_page[WEBUSB_URL_RAW_MAX_LENGTH];
> +	char				landing_page[WEBUSB_URL_RAW_MAX_LENGTH + 1];
>  	unsigned int			use_webusb:1;
>  
>  	/* private: */
> diff --git a/include/linux/usb/webusb.h b/include/linux/usb/webusb.h
> index fe43020b4a48..a3febe726911 100644
> --- a/include/linux/usb/webusb.h
> +++ b/include/linux/usb/webusb.h
> @@ -68,12 +68,15 @@ struct webusb_url_descriptor {
>  } __packed;
>  
>  /*
> - * Buffer size to hold the longest URL that can be in an URL descriptor
> + * Length of the longest URL that can be in an URL descriptor
>   *
>   * The descriptor can be U8_MAX  bytes long.
>   * WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH bytes are used for a header.
>   * Since the longest prefix that might be stripped is "https://", we may accommodate an additional
>   * 8 bytes.
> + *
> + * Note that this is a string length and not a buffer size: a buffer holding such
> + * a URL needs one more byte for the NUL terminator.
>   */
>  #define WEBUSB_URL_RAW_MAX_LENGTH (U8_MAX - WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + 8)
>  
> -- 
> 2.53.0
> 
> 
