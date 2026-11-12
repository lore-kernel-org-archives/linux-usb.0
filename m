Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794501242;
	b=SgMEoN/bUXWDvQVyRPWIUXWPhHVLe9YdO41n3oZTCQIpThGrso7xBkV/2ldPc5iwYPyR
	 oHFi/bHNXLRgLU9oU7bfX9bJQtWfi2zXQKCkQgYaG6tqcTzhuoLHfq6BND28gSlOqxyln
	 omr2gYb/PQxX0FuFnrc7hHQYCJFM7ffzcy+JLrcB/IBYeFj4LAIB1l4rAXTWR5U8PU7Vd
	 T3Gv27lDoOXm17usHTqXiglTeR0ZB0yV2FnlQra4IGrxdp2jGDWXajDnOMlIjK4uhoxm9
	 ZUMFadqA6inzWdUzRq6iR1gILcTOrTQZpbvfKpcGw9gxTMll3J5+lrObj096pRY9YUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=vjlOuJZpJu27IF2Rqol8GEHXhnQ6E8+vGutgYf/KK4M=;
	b=w3FVEmf1CgNYsvUzjKrc7pzte4q139MOTAtPI6K4fAFQfy3xZn15qqjYW2Iaoyo6qIXa
	 LA4CSYwzyzePXEGrcewPtBXbqKlSJ59XaL2ne4xOxXHsX1bv3zezj00x61ycp7eYrzd7h
	 olKb6+NdrHbmZQa6ymJeuP7O36dC/7OlAj7aAi/NASxkOnG1iavGCRtdPOjhTWZP/Mrvv
	 cRJm+t38kb3OLy6MRnej8/vNnfAtJ/5icBaf8ijxxphFDbzZhAQljUfkjYBRSnJacmt9D
	 DZFp60dPKh0U5apgR9iUDbqNtt5YaeWYGOFSOPgVUKA02qjKOvqVw4Zta9BH+/GUECA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MOOkggqM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FC9606A332
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 16:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FC9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MOOkggqM
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-533972e1731so2215351cf.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:34:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794501241; cv=none;
        d=google.com; s=arc-20260327;
        b=s8m1KIKcHlNGFSfLWUjNPoBK+pLZoLfuTOt5TiVqjbvQBOM+o6pbRykxZTRsnIInmD
         7v1DW1L2DF8PLvO43HxX17P/lUS0CeiPksP17TOzKJwPXYt00Aw0mB1+NB7ZFAWGn0xk
         0NIDnurhkgUg+2mJXexDG0tlEgHPKdghBhKW85bQGYFSGsD9miZIsOOhiv4sFQQHxEEa
         w+nnb+CrOtW01Wk97gR8ly7perZwz5yp5NLu1kMIcY/5pedpajZ8grldjobfBM7ZfHBF
         CvYmBfuVk7WNTJRHPou6Qvax3LOb79jcNpQ5C0ricILUMor3o2M8qCCt6pMYqP5GpOXl
         VjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vjlOuJZpJu27IF2Rqol8GEHXhnQ6E8+vGutgYf/KK4M=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=NoZtEXX+pHESwDgCpD6XmriKMMFysfQ/lsGq6OP5coUKH2r0rhE/YivEsj3/0MF6+U
         4ln+Wlx/fPddS39FDhrfp8LFi3JOzGhav+HvSWVS89qpmnMSfFfJv4/LQ5Vk1LrBsdpB
         vASx2BiNB004jEMi9iJwM4hgPhs0CaOvAlPMJBjehZ2H0Ud1n2w7w5rAm5JDukTH2G4/
         yAFX0o+L6x5XslHF4mOy2h4q4jEOcKgsAfLjBbjp85I5II8yg0/OlYvfNqutBssPxH8l
         oDI9vZBHiYreTS6iAdm4avTWxt4QgPNCl+7etmBBHOubyLGn1vh0twp/jWFsiobPLKYx
         pF/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501241; x=1795106041; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjlOuJZpJu27IF2Rqol8GEHXhnQ6E8+vGutgYf/KK4M=;
        b=MOOkggqMikZh71X1uCu9H4go/idBNHEOlTgcRRbyZm3rmCZNGKuwmCsZAsR0EZHMAz
         oVvjA3/ta64JtZTTafXPw6uFT8AG4SAKLb0uY2F7xdtw+5Q1Wu2f7O6WFJcLW5FQ+tLJ
         /JwxZLoRb3tUULXk/jJqERfMXT82NtUz8lpT0pmDmd8WuKRXaqYdSCeTlZQR93bALHih
         IeXBDwsaUeBskT18Pb/fUay031/kg08iHM1J5KFLC5KwYlSwDnl5ozIGXSgj5OMXa5mi
         w1W3yfk2k0okvjOwzoM8fHVUuS3aGRYJBdbqPAjriQfUGF5+llridn2GK58+/jA74MVx
         z2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501241; x=1795106041;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vjlOuJZpJu27IF2Rqol8GEHXhnQ6E8+vGutgYf/KK4M=;
        b=0nLhNqvukC6epF8/yKSgVYrxTKciFKCbG07QqQn528nL5QlTrf6GQXl882QQRHb48t
         q6GFhIrXPmL2CwRnz6XME9ODZi1meyrQzm27UiQHTucHpoJ9UlHp0veRyw90x4EO3JcP
         IY1Dn5IRPm9rz95arp8uBhD0f39+IHAHasGdsTjf+pPB6D0qP+Vwdcx5zoAsrKF5SCck
         wWequHXjf6w5Mc6i9fCevPIantDnKaVGE8usCWGg8OZXCZfbaUr9cmjYFr7OIW81tIKV
         USA8GPoz+tC4HBpAeUlT5OrLCpYLjIUYlNJ0fHQFgsILfe9oimGiGQ62MQ5serKCayfU
         yc7A==
X-Gm-Message-State: APuU4Z+CH9ZPbjPq0RwvB0JrHpMEZ+S/Bl7F0hLNoUimszj9wgRX3gpt
	QZUgbZBloD3qqBQ9MiE6qGw6VhpoVtoYvzAzcaZJjvWaEgyRuhCqXY0jtbXckUwO7NdLoEjfQfx
	E1Qh96xmHA2ucUAbuDc5w8hWLQPS6BwjwHrkF9tRb9Q==
X-Gm-Gg: AYBFou0n1ecLSzjJCOLT/lwVRKfBhSkSXi60xsgQXbxSqnR8uJWHkaBaIJuJkOZNs/n
	FnH6oFX2Ns0OPz+Hb3sD4ABYfxvpULwqBEIQ8dvnQ4tF5rtLkmvw7aT9zDpxCcBTrfvO4eeN2Pw
	RlooZ9KIvgVN1AAJyt5Il/tuFUdJlnBuQFR+5CTfgEcURCsOiQhHRv5ebILueIDGvlhbv1XN7gM
	/jbLd+ZZYI/7K64Yw+eFrH5Uc44UHQlvfD/ixcnpODFE+do0VSVbDNbaFimPV4cMK+5tLjD0fxd
	QM+aBVuLVD88qhKeQDHWqBoQFPrE30/rpRP1I0mHiQImBSmRwAZhChkuMTkesQKLOR28H7/PKXM
	wGe0RQV+6/L5yP5D9zp8zNtpOU6kh42iUpEwbDw==
X-Received: by 2002:ad4:5d69:0:b0:91e:cba3:43c1 with SMTP id
 6a1803df08f44-91f041ce878mr141426566d6.4.1794501240930; Thu, 12 Nov 2026
 08:34:00 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112160448.41566-1-lui2012qwq@gmail.com> <20261112160448.41566-2-lui2012qwq@gmail.com>
 <sashiko-outbox-211493@kernel.org>
In-Reply-To: <sashiko-outbox-211493@kernel.org>
From: Chengyu Liu <lui2012qwq@gmail.com>
Date: Fri, 13 Nov 2026 00:33:48 +0800
X-Gm-Features: AclHuK8V5VMmiaN-I58vSc2_c6jPp-maU1OVmpTHdynIFXySAJKBi6nA1SaldYk
Message-ID: <CAE=Q7=4PdubbUYnNwcVHg1kbChe5ukOxD_uj8ee3+J7sW5OhUg@mail.gmail.com>
Subject: Re: [PATCH 1/4] usb: musb: cancel irq_work after masking interrupts
 in musb_remove()
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks, f730f205cc51 is the right one. I'll carry the corrected Fixes
tag if the series needs a respin.
