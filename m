Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437489;
	b=BZKtn/4l8kcxJkoBU1itXxvLcvH0D6+1nSwvTzrcAiwAUlkYV2wcrSwx7rV7XmZl+IQe
	 zJYlrwnAS40awAcBiVRJu6hPffFSH2ukLlsYEGOwZSsHlztiyBcSKtuZqHETK1EMooCsq
	 rXA9nZwfekBhaCvVYgqaGAWKSV/Oep5f4phMx3OsLleYOlqCeTrTn0PWEh90CUc4pE9zZ
	 p/sN9K1FHEY/2wltrAigWzNZjQcBCwL6SINWsZt49qIpdKb0k2qE0hxcP4o6bLtDGPzj3
	 Xd+hqydUBWH7VAQkJOVAxNfSIRJhLFGZGws60A3U12IWcIAZ1+4KEIzzFn27A2p9/sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Y5Bh3OM94vbyS3CSV8Mat5RpNbjCjrSZ4b4DTpdLZyk=;
	b=dR6bsoJLGW1jziOvNxVOHMkwNTay4Ed2ThZZboVXRtxDDyKKwFl2oKnIIc41KfrzyF79
	 120SNtNHCAMBpiiYJO+d6JqVnZrVN/6Ln86g2tUJyaQucJffc8OiD6E8se3sIRe7qGfht
	 HaPujdr6O04YsB6q1cxzDzijwiCEIT9Aox+RN3tQQ/L5tOk79lyejLtWuuttaLbQMn322
	 nXXbGCEpI1UpA2HfG/fRV28ae9iRm3KRy3L0G7TAZsG0i1Ec5qt6lt9UwOHk4UUcsKDk2
	 j0eUIDmLbcIy/QI3a2fquWa2efFCtEKtVMv7gxKMxW/wq5sU31ltwuEGaDf8PjAamaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=MbgB+n3m;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5D3606A321
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 19:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC5D3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=MbgB+n3m
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-706113e92f9so680658eaf.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792437487; x=1793042287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5Bh3OM94vbyS3CSV8Mat5RpNbjCjrSZ4b4DTpdLZyk=;
        b=MbgB+n3mmfrDtrMd3DEypKqrGku+2udy8qrjC1s47ITuZJQilKMB1qn9NA/c5vb43t
         FVulannv05fMSUkCrJKsJwRpjHDhFlR6oZirA9r6kYTOrwVDoeTRSM/8FS+g4MuWW54c
         mwABt8A4cYJmkdRuHrRNIj4AV39M52KeekvYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437487; x=1793042287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5Bh3OM94vbyS3CSV8Mat5RpNbjCjrSZ4b4DTpdLZyk=;
        b=11h9C930t8SLGmRZBlSImyviTrcurHcagTSTcIsZAB2BPYo77eNHru2MV/BeELpSUY
         yP7Zx44h6pkNGL1cXPt5Rqa87XOGQr0141+5klJ96Rk7Pa1IMbphMPNWRfi+kn6EpgVB
         w4eTwwyqOPASbD8e65TrLVPFtXPtmF3c4ORE/omakwZfj4rzk2LVRt4y5B7MJwhfEh85
         7Iq90FBkQLAn1ZIG5WRaTAF+0Sw7gfel030iMpIms7zVBhVQEBWIJJEHTu6u0yORQZzM
         8EZoftlFToI81Hb6hTYq7vebHLSF0DzkgRSefKP9216A1Jh0EiWSEszcOF/Crotqghvl
         tXNg==
X-Gm-Message-State: AFq9FYKE+AYPvFDYk1FeCaJZBI6g3DqOpZwFgUjbSrls6x9GskKOLxQ0
	tiDq9ptL/Z7KAlUGBiTLNX5w25B39T4EwOi5Jr+fLhIq8Cj/v7glhps5qsOQJG7CSAw=
X-Gm-Gg: AYBFou2Zs068OIoMyGAQQD/Xt7PMOSdDMCpjL5wxKu2KlEk+epG2F5dvYQHOmv7FYRR
	j3Ni7WW+WisYtblEHVCICRIR9kGJBQOE1viPgyJg/rjkETrVdYsh5pzkIAQ+GpDQoelOKhyeNOo
	PkAciNptKniOf+VItp62RA003oV/IYyGbqhFXl2QI/tERbdSjC3nGW2i2UmKHtqlzwXwmZPONq6
	DqKIQ2gZVi1+nL9JYu9ULrDGuhwZp923CtjShUUw1jpvC9LYHVRRZ6OlNCYyA9DUpMj4EeihOkD
	p9lIj1PjRZDDdMOxxoV3tvXXCC3gWYhzueUcRaKqE2MC+G8ZwKNkciP7RBEBi8rAaMrrmITqIfT
	H2VNLiRbCtYIwKl1F4n2v217WreFq4uvq/24q95V2be3dmD6/KJAWoyyo8PkMBJkLrrQChMZuCs
	ltvIPXlQR5l6lkgS2//G4rp1Ew+PE2EE0D1doo3DoyQgvzf4pYmWhLs4KAs36xMOC1MYCw777aF
	6a4O0GH
X-Received: by 2002:a05:6820:f011:b0:707:5453:73c5 with SMTP id 006d021491bc7-70754537560mr995388eaf.2.1792437486806;
        Mon, 19 Oct 2026 12:18:06 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-844d2ffbf71sm7504439a34.4.2026.10.19.12.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:18:05 -0700 (PDT)
Message-ID: <ea08392d-dd6c-493a-9e8e-f788bc2cd158@linuxfoundation.org>
Date: Mon, 19 Oct 2026 13:18:02 -0600
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: avoid dereferencing a missing device in receive
 errors
To: Sung Byeongchan <tjdqudcks0424@naver.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org
Cc: linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261008134107.265827-1-tjdqudcks0424@naver.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261008134107.265827-1-tjdqudcks0424@naver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 07:41, Sung Byeongchan wrote:
> VUDC builds synthetic URBs which do not have a struct usb_device.  A peer
> which closes or truncates an OUT transfer after the submit header makes the
> shared USB/IP receive error path log through urb->dev.  The resulting NULL
> device dereference crashes the kernel before the protocol error can be
> handled.
> 
> Guard every shared receive and ISO diagnostic which can consume a VUDC URB.
> The protocol error and teardown still run, while ordinary URBs retain their
> device-scoped diagnostics.
> 
> On ff47652a4b66, a real VUDC interrupt-OUT endpoint reproduced the KASAN
> NULL dereference in three fresh boots.  Normal and near-negative transfers
> passed three times each.  With this change, the identical short transfer
> returned a bounded error, reconnected, and completed a following valid
> transfer in three fresh boots; normal controls also passed.  The touched
> source is byte-identical and the object builds successfully at
> 47324d3a5b3a.  This demonstrates availability loss only, not RCE or LPE.
> 
> This issue was found through manual source inspection assisted by an
> AI/LLM, then evaluated with local production-path dynamic validation.

Okay. How did you verify this fix works?

thanks,
-- Shuah
