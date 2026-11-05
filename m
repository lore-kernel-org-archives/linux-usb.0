Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881838;
	b=VreMInmvjzONw5F6OzytG7bjhp1O4oRnx0QZiXhdoo4HNd1YHa2GRB41NoKpKlD6Po1z
	 JvyNKY+WfSG5UhKWof+O4Kv8BN56L/sp1xVjupnCw1vK1IoAjHyFLVJemQGEdIWxOuo3N
	 v/vIHlwF3piqMK0p0H4lGQdsjrCf3jN/QabdWjpMDXBuFqkWSQk9Adyi4sBn89sWl/8hs
	 fKl3BsJPP0h7oP7NjXFy0swdZHQPEEwfTNDFhFH/K9e3Ct0tIUMslC3OmS96kTkawfqoq
	 hlyA6IhWXBn8jksKoYh4391q57J/4n0hR//RquM4oiQsuDQUlPvbXxnImoWkQ03JMbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NXQY59s7bZpTSHFUOUk0f+WmyGheH78ucLM4Hd8zHqc=;
	b=ApjPInpERDXJ2DJ8nHFmnq+K0D1HDR8rk/K+bMr1PNNlwHHx5h8iREJFIcQ6bAhcaW1o
	 bzc9w/CXuWoIqQQTUNvgkKz0AGzXubKY36Ox1FbGlpcT9eVGRtM9O+QYnGvvPuwv2y65H
	 JDhvSQujup3uRs65/F0dodyePQPujyj3eEmp+1D8+9jsX4PkedkC0oVK4e2NTaa87Oo1Z
	 oZkj6GAT2k/8hSyFHxQE+0u1hpPubJOK2ebOInlBPCC8AgoiU99wL+cyhKNeIyj7xEjdg
	 tKc9lmfWCFW2EwI+EM+PAb0LvpjcAVJh6uh4OUXIMu4f9VUaCzZql/nR7oRqA2Fqwng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPhhH6+N;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB3F606A326
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 12:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FB3F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nPhhH6+N
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so13994415e9.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 04:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793881836; x=1794486636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NXQY59s7bZpTSHFUOUk0f+WmyGheH78ucLM4Hd8zHqc=;
        b=nPhhH6+NmaqLVBTjCn6gLiWxt54G0rgpmjDMCOOOwIWuE7hkwZaTwdHSUcbLz90bV3
         +ZhYUFxfNS7WxFP0TCpE2V3+vHO/juXGoxxLRmQAG1M0RU9BwCAIC6xrf1jMiPl7o2Ys
         87goIbnEB+AfvUgROipi1L6JBvIsJ37EY/02vV4hcGgnLBoV06mTIbqcKsRj3vaIT1H3
         eS7zqYVWOirImhoCWwjmNkft6z7CcanMqZG7wJAvrrmk2Ge6lrxeGZdEDDTTyD8TFphY
         Ih93YOQAnCpD94CVFIldfnCL/sushsVq1Om2ZW5GSygkVHDGFcvj0LHnRYakzU9XaN/D
         x+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881836; x=1794486636;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXQY59s7bZpTSHFUOUk0f+WmyGheH78ucLM4Hd8zHqc=;
        b=UCnagYDd9SBmsEBTbhmHFIPtNJAZDoLMby+Dau5pkznYbiMzNBwnIlSsyvZmuoNvvb
         fUVqOG2ywwSFr0pzFae86Ckujt3Y2j1SfeIJbdFhmseJr3OuX+Nxlt/Xj5ROXXL/1EC+
         nu1n601xbVf6BmViUOyM8yN0LICIDErR3x/YASMsecxEHpAoMX5qhmaMMqkz87Y+G1ds
         2LMHtGE5PfcHZ4SOSXzkJKzn53aahOTZn8FkvcdkNzTsfKbI53R+TsnOtcq3L3I6pOc2
         vYw8X1TrtF9PvtThw4rV+DJ7lM5tcrq/1AX5mnGb8RRoibOki68JvFiBTkdoCtyq+9dw
         W7mQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWH1/+lCD0CcPY2WGN3vNXsO1fCTo14SRe0YWD2pf/fyY9De2wk3mK4m+4UJLFgV6LUrFccOoV2Ks=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/JItVDm3em6jNfScNSKo7rPxkHrS2+IfR6Vj/xyEjxF4HboTo
	jOq9WeO1GuhFydzuBDTOysBLloJvQkcq4SeOQIO1dnLqXPzoX6ZjpP6T
X-Gm-Gg: AYBFou37tYEpeqHP/cfkhgqZjdSfQRhh82mjH9knsKK3SmsEHHrC2mZLpqSjiy0hy40
	FxHO0nehuwq7E/qjCQAN/p0xSWNghCugWO+6OrR1AekF/UdtzbDWCujH4E5yXn8970bHxB/e5FM
	HPxvLECbrAG5noUkOFdBL8jCWQRDcoqJZL6iFg1jBJWxMPVhwfZwIIXUgUJr4iKQKnIoqvVAkUB
	OI//ad6y4VCJdgweTPfa1sodM3PXBwznoHu2LN8vTIPIHEiSvGDxGdXN3+PFx14SRg9+vcXhlEh
	KRm+B7N527ZMj4HrDIfKz1SmOhmYfN5lXQBI396KPnlnCa/l6SFyDCvCIK9UQiRtXGQ2g7M+8VR
	MSWJ5jd0NNvJAxfnC8tbY9pedBRbNQg8iUrS2IoBHNRh0X+qdrDewkYdSDWAUE9J/y+lBwsGW5b
	o3GfYmz/2ktHAZBzkAmtDN6A9jJvjEwDsmTFvE+lgXPZHzqzfTvz3gR1DUuG1VH4fltDhv/szlY
	9jHuSMnig6i5g7PUGPQvxMoS7YyJ1E/L/ikPCl0lm9FyL9ZO0jTB4dq2Y+vkYkFxinIxEHOsuXS
	aBkx9wiYHAedqduEBC794Yl5Hn/5DdfDLkae/nI=
X-Received: by 2002:a05:600c:698d:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4ac185bd1e2mr417810655e9.16.1793881836320;
        Thu, 05 Nov 2026 04:30:36 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180ee1sm11450138f8f.4.2026.11.05.04.30.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 05 Nov 2026 04:30:36 -0800 (PST)
Date: Thu, 5 Nov 2026 13:30:31 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Pengfei Lv <lvpengfei20@huawei.com>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, xuhaiyang5@hisilicon.com, xuetao09@huawei.com,
 caiyadong@huawei.com, suzhuangluan@hisilicon.com
Subject: Re: [PATCH] usb: core: hub: Re-guess ep0 maxpacket size on reset
Message-ID: <20261105133031.6a49f1cc.michal.pecio@gmail.com>
In-Reply-To: <59b0cc88-9ac2-453b-bd68-56aa356c0fc0@rowland.harvard.edu>
References: <20261104124402.1269650-1-lvpengfei20@huawei.com>
	<b9ac3c8f-7ce5-43d1-bcf1-d2ce9877d914@rowland.harvard.edu>
	<20261104183603.17d663ce.michal.pecio@gmail.com>
	<59b0cc88-9ac2-453b-bd68-56aa356c0fc0@rowland.harvard.edu>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 5 Nov 2026 00:06:24 -0500, Alan Stern wrote:
> On Wed, Nov 04, 2026 at 06:36:03PM +0100, Michal Pecio wrote:
> > Were there known devices with bMaxPacketSize0 <= 16 which required
> > the whole transfer to complete before they are reset?
> > 
> > That's not what happens in the initial iteration, so it seems any
> > such devices would always take two iterations to begin working.
> > 
> > Is this what the only correct Proprietary Operating System does?  
> 
> I don't know offhand of any positive or negative examples.

Pengfei believes that the current behavior has only existed since 2023,
so perhaps no device depends on it for enumeration yet. And proposed
reset matches initial enumeration, so it seems low risk.

> But if a device was going to hang if it was asked for the remaining
> part of the device descriptor after a non-initial reset, how would it
> ever get through initialization?  The procedure does two resets, and
> after the second reset the device has to send the full descriptor.

I guess a device can harcode enumeration, including the 2nd reset, as
fixed sequence. Or it may send 8-byte descriptors while in the default
state or when wLength=64. Not sure why it would do that, though.

> I don't know what other OSes do about this.

I tried W10 in QEMU with qemu-xhci host controller, the device was an
audio dongle with a HID function and bMaxPacketSize0=8 passed through.
I disconnected D- to get errors without port disconnection detected.

Windows doesn't seem to switch packet size back to 64, it only disables
non-default endpoints, checks port status, resets it, switches xHCI
device state to "default" and then reads 64 bytes of device descriptor.

This succeeds because host kernel has already configured proper packet
size by this time. Not sure what Windows would od if this hanged.

Later of course second reset, address device, normal enumeration.

Regards,
Michal
