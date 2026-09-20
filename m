Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA823E315C
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 21:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789940146; cv=none; b=Y+aZlyFzooJPz7AUb922m4i7ZW3ra1XAgWD/yGJ/iLVLEaYB0nxI0plrFVMBFXb9hr9WaDvWvp77HHPKymeoTDpEo04QMfTUwSlrT6WDm4rWJx73QMf08SRsfht5wWDYcVNZksghRVCjPzRFY06okV1ONlVWkOSqysutXER8JSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789940146; c=relaxed/simple;
	bh=NmYkQwpyv9xYmpT90KtYQuxrRy83CVU3AlbHJGagHFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A/AnIxBIXUfvEGkAtorx/mkAajP5DFI0c2E69/P7fiv/aP2F450fUDO7DjGefCx0WWSG7m/pP+VJ77HCgeYHvJscghlJ0cVvcjNZYuFTKy94OHktGAsbI1TpeUYeBUMXbO5ahjDif0OKcIvMJH3VD67Cshx3Q4pv/Vuh1tQINRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=apir4WUG; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="apir4WUG"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a222edc62so263910785a.0
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789940142; x=1790544942; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFQ/Zh1XZQzUecfFe+TiXr+vLwCYLXiZxff3Rdqx/7w=;
        b=apir4WUGzYhuNG/IDxGaRH0ziqm7dkUDGQDGpe843YE/ksPj0JoMqR1E8YGqIHuz5q
         0qTOonRnztCrMUjM9qiIlv7gQYJI1SdCSq51DZqKvgc6ytvjsHcFGf+0SiKUU/6iVHPn
         rfTFe2CHTzQcAkIQiqcVOdjfQ42J2auOTZsilfiBzeEaFZ/Jj5lLguTeQ2JRS5UP9yIi
         /mAkQjCC1K0enjDcaAW6bauZ5oPAI7ZtgDqIq96g4eWIqBvHGemCGfpVGZddTsw/n4Rb
         AjlZzy8ZYW2940ZwxJJuphGjyWu4srho9SfPaLDbujF982KhSkDiyjyaZ6miDk+aMrwd
         +MSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789940142; x=1790544942;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OFQ/Zh1XZQzUecfFe+TiXr+vLwCYLXiZxff3Rdqx/7w=;
        b=AqbQsXHg/NILiTiZVjQzBooZSzJVTqNteRmBOVNrWyW7ThxRQmMORdtxs1iumPQR2+
         9OpuWn06wgaE1vil+oavnauKIe6weMo2VdLN4e90Yfw2fZLQC7KISMe+x64EPOJ88R7q
         UPvftbFo/LCV9SSw6ZkcJPgntqnOSIFtkbi793ZD6E/J8iAJB6kACrk4dj4G9eRvW063
         OH9ri74w65/IYV1lggUVa/AH/1bFdKdm/G8ai2bjQe4detLoxBrPG8h6IRAra1lpu934
         1bGTgyqjCXrUleFHYaODAhH7hGdNvEB+eKuVD5e0TVlBJW8jIkfrw7MjnIa55E8GF7Ev
         4H8g==
X-Forwarded-Encrypted: i=1; AKwUvBzU8hOPnKXgNACalvnpxgd3l+B9D3wzviMfjYs3tyW5wjpJdkYKUBgk5XgkORjr1mtH6nIrHLuaIAs=@vger.kernel.org
X-Gm-Message-State: AFuF++kfkaIV+y0kGbu4kuGb+gngE26/htFx1C9RXBmR8ijri+CKDD4F
	/KBhhUX9npgZYrUdt8jLgxP71pVpzxSSDx3swxT6kvHxeeNeu4Ui4cVFhVTpsf28OZwjR5t58d4
	7EbVUeg==
X-Gm-Gg: AYBFou0Ifni8/309JBPFRs68fqyzR2nqbmVYjP+jYbvFNEs6j8zD5ulceIc6DOzVkIw
	f+i1BmiXOGLF9ZenPkk/XV6oTeHc12MWaMm60RBwBho/k0qmrXfReQppxUvciRPQvftuBBrt5C3
	r5n3bOEexpETCuxbR5uo/YvRz/2fJmdEMIRZha/cZDi1xmEB1X83Q3tQNX+tMo1Fiyrlm1vRzP3
	Q7pbGPVaxS+lHCR/TKm6xgUePErVdBPI4/oGmeN8gICdsunvVZZCX6+AxxJ6xIGEIwc0v8cdUbR
	yFnFn/Uvy/kYBKlFI1JcsIzYgWFLfVUdLvkf/IQNz4ENfGjlOA29Wjf6e74M1GaCkdcK9et2yQB
	1DRgBTNEmoUkQRO0jBtTa1Lb3EjoisTycfnXbBXU8IO2xp+kQNgZKdQHHnuUk1k7da900l82uEa
	2uapDO/sYgsSbDKnvxAPg2B/7nNsPRoMZyWI0nejEVG5wzb9AkbYW9ZrD9e4L+oNI8P4uhA8i5
X-Received: by 2002:a05:620a:414a:b0:93a:1048:7d2e with SMTP id af79cd13be357-93bf5719c6bmr757829185a.44.1789940141795;
        Sun, 20 Sep 2026 14:35:41 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93beda72290sm485272585a.8.2026.09.20.14.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 14:35:40 -0700 (PDT)
Date: Sun, 20 Sep 2026 17:35:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Minseo Kim <neck3922@gmail.com>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: gadget: core: Improve documentation for usb_ep_disable()
Message-ID: <d9f56a9c-2c94-4002-b674-53ba7e5ad5b2@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The kerneldoc for usb_ep_disable() in drivers/usb/gadget/udc/core.c
starts with a confusing (and probably meaningless) sentence, and it
fails to mention that the routine can return before all the completion
handlers for previously completed requests on the endpoint have
finished.  Also, the summary line doesn't say what the routine
actually does, and the text doesn't use proper capitalization.

Update the documentation to ameliorate these flaws.  No code changes.

Reported-by: Minseo Kim <neck3922@gmail.com>
Link: https://lore.kernel.org/linux-usb/fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu/
Link: https://lore.kernel.org/linux-usb/0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu/
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

 drivers/usb/gadget/udc/core.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -142,13 +142,14 @@ out:
 EXPORT_SYMBOL_GPL(usb_ep_enable);
 
 /**
- * usb_ep_disable - endpoint is no longer usable
+ * usb_ep_disable - unconfigure an endpoint, making it no longer usable
  * @ep:the endpoint being unconfigured.  may not be the endpoint named "ep0".
  *
- * no other task may be using this endpoint when this is called.
- * any pending and uncompleted requests will complete with status
+ * Any pending and uncompleted requests will complete with status
  * indicating disconnect (-ESHUTDOWN) before this call returns.
- * gadget drivers must call usb_ep_enable() again before queueing
+ * (However, this call will not wait for requests whose completion
+ * handlers have already started running but not yet returned.)
+ * Gadget drivers must call usb_ep_enable() again before queuing
  * requests to the endpoint.
  *
  * This routine may be called in an atomic (interrupt) context.
