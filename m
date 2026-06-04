Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568132FD696
	for <linux-usb@vger.kernel.org>; Thu,  4 Jun 2026 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584987; cv=none; b=sEjqsKuaOJXUsPV5Eh4lktpcktrjdlE1Lhwh0EhsBmtA3BeJJSa07wpcTCoLi5ZaDIjll/k4vuxN9t23Pfa7Mn3MIRbT9jaiUOLKd7p6nK23ckyhuFKk7FmT72gHGi2x5ZDNLWrHOmlL/gXBG/xOe4oTkSPh/6/EWCRv/ZQrKkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584987; c=relaxed/simple;
	bh=J4e/WT3mrcpiVeolkODYuZO+WXuzrFvz/VJMqij5lAI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CUJW1in7/20SSvjEVRjEA2eQD1GLPN/4ULlnC1P1XKG1Kd5g+Utg4Tvo+k6Hp7SZ6WKP9b5mXRigUwlRPg9MjjxfT704Eq9/LRdwOTLyKdzTUVWcn/MjcU7B4iAJpAwx0Q9gZwTyGkmtQ9TpJ4c3HMsZGwketgGacF6vquFM+mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoNGDKZk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoNGDKZk"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so5606385e9.0
        for <linux-usb@vger.kernel.org>; Thu, 04 Jun 2026 07:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584985; x=1781189785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNH01qFsaNOBa5+CT8/g/fxi0qw6y4MDjPr0w/s6vDM=;
        b=aoNGDKZkZdNe9sNMTqNIqF9I6OMZkOu8K8ZgDj+AgC8K4CN6Jt3Hq2dWLQpYCfkm7X
         m6V5PQz9fTje0b65bTPZMRk3lgeo+FK2bDrR2MnSjTR+ohBoLj+cSLtqg9xh0kF+tojR
         We6McJKg8ww/6GMqx2Is5rgZpeSNBgzHbVovhZbirysIlmRdotCjv4dJEYYkAWq2TJY/
         AZHpUaxavG4jeeNx40wvucsojAOHfdggUgiTpu0kyu6PoimAN9e8s1qPsJdQeV8eEgpB
         LoUVCM3JIOku0SjUZ1Y80xi1qZqsCWK+zojk9A2yhCrRoMacPHyAq44Kx2DNZ/tXT4JC
         tqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584985; x=1781189785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dNH01qFsaNOBa5+CT8/g/fxi0qw6y4MDjPr0w/s6vDM=;
        b=jkCq4Cj1JsTlHBwukz+W3230oP+SLFUPnrWlkTJgQfJLfBdxRp6TMKPWQCWQ48H7Se
         0PUOV/xIpbrJG3qWnRJ9fWUSn9KHsjmTYvoFR6CHDVTLMWKcMmktMS3477Ei6vGtYCMF
         ovICWbyL4YfycvFbPdlq37KEgQpCG/Y0ae21eZjJi6SlcLZ3YGIXsKP+WLvnRkFeLXEj
         pHSOBVWVwNa9yUn3JpIN/FRf5ouGBeGITHRkUFD0o7/wVbjmBPER9X/iuXVvHTZX5Pld
         eUowjM67SQfRC4teJMaYZe5Y5iN8XinagIh693959exeyxACtwzjn14OtMPnk/lY/B42
         sn5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9jSyPsWLfP50GibM3sD81Z7NRt5uUNRnfL2cmJHrEV1wn3aYRz/BlUWTT0/K30fHvcDbuHgqir1yk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVvVUWxayUHVzlTkiqNE1ihFqUHdu/MsotJ6QXTZlJnM60+QUe
	y8YI6yqJtTuNGcP9iTrBCRoFE5jKGFMXufubiNOZ446NkphiIAaqq4WI
X-Gm-Gg: Acq92OFwz5rBdC46oVSg9AWZS8HW0BPlpMxPt/6jegYGB8TJ1pTNe9sZaZH7gxiwx0j
	Wg4XiSgYLcv/l08qd5pL/ChA/WWkBXsgXdfAFti5nyOh2N+P57c5kkVShD0xaOQ2F9GDVHjBv+s
	wbaJg25vnprJpkmVdgfxFSLvIRaYgXDODKl3/wzD5vXsjH4/sFwoLW7/y1kz7ejkl9Lz1DYv96W
	xPqdQb11d3Vmsj++5timEjdxj6/xh3ic6bNXuvYJ6Wc4mw14XDwnWQeIPsx4yGoclcpQYPUBZkW
	Qs0E1OiSHaEtvuJuKhxQ0bCZtHo9wW4NmNzRLRIb2sYvOo/0FxNz/EdpHEEKMdoUsJQR991NZ9L
	avoPmChqNF4iHrw37sIAHbUnwfPl6Svd0NCsMWVPedAXZewD9fRov+myjwegnQbpjupvtTjXnkl
	qSRKOIAD7jH66Gsd7F+t5rqloKAoPmEk464ZAod4ei0y/Jew==
X-Received: by 2002:a05:600c:529a:b0:490:bf13:a1b with SMTP id 5b1f17b1804b1-490bf130f0cmr40243405e9.26.1780584984636;
        Thu, 04 Jun 2026 07:56:24 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d64e8sm182362085e9.0.2026.06.04.07.56.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 04 Jun 2026 07:56:24 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:56:19 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Johannes =?UTF-8?B?QnLDvGRlcmw=?= <johannes.bruederl@gmail.com>,
 linux-usb@vger.kernel.org, A1RM4X <dev@a1rm4x.com>, Vyacheslav Vahnenko
 <vahnenko2003@gmail.com>
Subject: Re: [PATCH v2] usb: core: add USB_QUIRK_NO_BOS for devices that
 hang on BOS descriptor
Message-ID: <20260604165619.592c4e24.michal.pecio@gmail.com>
In-Reply-To: <2025120846-nearby-breath-e5fe@gregkh>
References: <2025120708-header-startling-ffaf@gregkh>
	<20251207012059.7899-1-johannes.bruederl@gmail.com>
	<20251207084012.7c232e52.michal.pecio@gmail.com>
	<CAP=XvD+dNNDj75DYjjByE3o7F8i-QxusAdz-5+hG24fCesWYRw@mail.gmail.com>
	<20251207104505.1d5f3718.michal.pecio@gmail.com>
	<CAP=XvDJJP2orxYcgiKzp0FrQE2UMiXndZe8Z6BdBRFvkujWu5w@mail.gmail.com>
	<2025120748-extras-retrain-16eb@gregkh>
	<2025120846-nearby-breath-e5fe@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 8 Dec 2025 06:12:15 +0900, Greg KH wrote:
> Ok, I can duplicate this here.  Maybe we just don't ask for the BOS
> descriptor if no one needs/asks for it.  I can play with that later
> and see if that helps as I'm sure this isn't going to be the only
> device that can't handle the BOS descriptor if Windows isn't querying
> for it, so we don't want to make a huge quirk table if we don't have
> to.

Hi Greg and others,

The workaround is now in, but if somebody is interested in getting rid
of it, it might suffice to make kernel BOS requests more Windows-like,
since these devices work fine with Windows (and Windows queries BOS).

By monitoring Windows 10 in a VM I found two key differences: Windows
fetches BOS *after* the configuration descriptor, and it requests 255
bytes at once in its first attempt (there is likely a second attempt
if BOS length exceeds 255, but I don't have such a device to test).

Any chance that the change below is enough for these video grabbers?

THB I suspect that it's the ordering which matters (the devices respond
to BOS queries by lsusb after enumeration), but implementing that seems
a little more complicated, so let's try the size first.

Regards,
Michal


diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 45e20c6d76c0..ca42e89399d0 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -1037,16 +1037,15 @@ int usb_get_bos_descriptor(struct usb_device *dev)
 	int ret;
 
 	if (dev->quirks & USB_QUIRK_NO_BOS) {
-		dev_dbg(ddev, "skipping BOS descriptor\n");
-		return -ENOMSG;
+		dev_info(ddev, "NOT skipping BOS descriptor\n");
 	}
 
-	bos = kzalloc_obj(*bos);
+	bos = kzalloc(255, GFP_KERNEL);
 	if (!bos)
 		return -ENOMEM;
 
 	/* Get BOS descriptor */
-	ret = usb_get_descriptor(dev, USB_DT_BOS, 0, bos, USB_DT_BOS_SIZE);
+	ret = usb_get_descriptor(dev, USB_DT_BOS, 0, bos, 255);
 	if (ret < USB_DT_BOS_SIZE || bos->bLength < USB_DT_BOS_SIZE) {
 		dev_notice(ddev, "unable to get BOS descriptor or descriptor too short\n");
 		if (ret >= 0)
