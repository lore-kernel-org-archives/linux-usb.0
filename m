Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F8D49B5C6
	for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407818; cv=pass; b=nKg+UAOWVrUHrIEAP7pxHVTqWQEjSgZxUXzl/8HW7BFSqqqnK287iaVCzrKytfhXCUax/WI2FAOm4XeNRcS1m54zOmxI2q0oHZdwo10/fZYpMcY/TnX6UV8TVlTY5vunZZA6fb0pxw8ymuiHf8RHeQMQKW3Dx11Y07Nzq7UjpWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407818; c=relaxed/simple;
	bh=G8OXot6V51BBfVoTQkyM7CkQn7BJdVq/SOYBCWzt0II=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDE2F2zdwWGsnAU59/2+8CZklw9cQW/2qXGkLf76QCA4HNz+1a6bhduED8ixL95UKgja/SKbP0RQwLGOFZJ2NSvK1A2XyG/LpM9V+rBl9SNa4Soo0naAEYaEH0FpEno54+O1OTWTuwVTUDeYEVdKkzNsqweqiMBcWTmLTPE6184=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7vGSwsx; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7vGSwsx"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d4e39e3d8so6252827b3.0
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 10:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789407801; cv=none;
        d=google.com; s=arc-20260327;
        b=kdZAJt0JWOD5Ch0sIlrK0Kh1kKi8d688qpENfaL4p3i6pBiqDhNBU4l2q+yIrBed+R
         xlVnuCiAKAQvESWLTO590VT8boD1b4CnKEna+oGeUx1N6HVzD72d63GMYNkiIfRZwPd3
         qoXLC44YRG4W9jIHiA4JX55GM0T/jU9Vi93lL4ri2Ikam0lZfE4E9s4g34pCLcqnk8eQ
         VS0ucTpw65ISt/f19JHi1rutkYuAdVeLhsIRYJlKlieiDbZ8S/76Qpnx5AcIAiWPBanI
         azdbWz6IsL5mshdt42JCLgCivysg/hnp82vwOP7+gQKQZz8QQP0wnbdxMMYHuznAnDcU
         ef0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=G8OXot6V51BBfVoTQkyM7CkQn7BJdVq/SOYBCWzt0II=;
        fh=pW0YD5QP0ZcUxSyEydUVJnSxZoi/gQBwY8v8ZJFBYR0=;
        b=fcckLX3xGWYuyiVyVM4Qu9Ho6ItHpYGOkWLgRb3hN6f6zF6pjKLBP65E2ZElYK4Tgo
         o1MvgPT0sxR0Q4N3+gP2RrjVR7EsAUrxfnDzFgp5FAf/9JOBmcRsb/0WOsnw4rMWLYcE
         nILWOWjFaVi3mKQMRkRDKMu2iiP50ltg7JuKBMwExsMOtQqUTSIfHU0n3GpPbCTdqPKE
         1S0oZJMWoM4SfuGDMyv8xtW2PElXybdYXShcGhRq4E86P+NAdxr3hVG5KUmQVthkk3mm
         jp7W0w+NfMYAwvRW4wY5dp2DLurhHzZLYc5c5i/vuu4jHA9EtXWGuA5ypOdvt/eFoI6z
         +Uxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789407801; x=1790012601; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G8OXot6V51BBfVoTQkyM7CkQn7BJdVq/SOYBCWzt0II=;
        b=X7vGSwsxtHuy3PInpUHRupz081iNn/5weHGxaEtOZggsaTEpVswb/UrKywDL45qxm4
         0puYmi072rjw3ML5oBljePDh6NbaTxiqZuZoobgCczGnaoQnV/IWZPCaj8JRvg7OT0qG
         zAw0znAbA9uGae6sZq4VeHWovQBYmRKh+JVpaRBOLvG2mztI+TFwaJTEz9KbLxWk3pRA
         hp/Dn3oU5QuwwvrqGZxoXzAihDgHNV4znnygeYlm7vKyIqm5AEB8xVJXXRU0MMPgtWPk
         ubtA5o3ZG1EhFMigwUV5mBd4azplk79OsLMqgCcFbR5d8Y6wdEQzJJy7RZ6Pw34hw2tu
         iQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789407801; x=1790012601;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G8OXot6V51BBfVoTQkyM7CkQn7BJdVq/SOYBCWzt0II=;
        b=Q50nVeXtIvUREnnFpkMnGOK+MZDp4KME+Ln3a1+Sjs8aWfYzuGbt6hEQShh7wAPHPv
         g4EWwwRsFlZAQQdWMaTzLeUJCPmVDeUPlMTR+ewR8HkEQOCWp41EcIn7wwMf8TG6WC0L
         +E2Hn8DcGxyMh/O+ZbuUjRYcKtNcbwA3VSqLa6xhEIHOsM/aoRzH2zngjvwgyw7y+pKF
         wq+41KluTnFdvu1u/sr1R0/A1/utIi9LedCzMIar6I9fYc6W7T7mKcu3gqlRaS1scC1E
         cBu/aj2krrcOMtmzmMbnZ0mhYZYVieM9IOgb8l7r1qqmt0ruKyMQ5v+Ayp4aDedojxgo
         1AvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDps4slAaqsClmvpLzN3fjwAbuanwNClrpNwBI1BYe3qhfiWJBWZnzgWoRae3c6bYtobD9bzCWMMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m6x2ZSu/ZaoMRT0oV/rgubsT3iMWp5k6s/atu2/YKOsgmIBjdS
	yCwMV2HIJKUpkwk8iu/PxNl6NIcK72Z1k3+WXDgCqcyfH6zZEPGznWHnDmE8HNMJ47J4iA7Qh9F
	sZQcqo3a71mJsjgseYpmSXj0FcjEncXZe0w==
X-Gm-Gg: AYBFou3FsnyjdsNQ+LFS7oksXmGo2KosjN7dJesGpEoCdrs+gjjzQgTBwiBT+VeCrQc
	I4RDYNkWHI1MWj/IhqGxs53FkexHxoWZyUsKAW9XUZnzagfL5TZVQhxrXDeRAowmE8mNXRf0yUx
	CNuTZWrEHI9EBkSfT5s4dyli7BLdaDaeq5leuNXnMOiGjdWFRA29Qgvuj7xjL+M9Ynh97P8b89x
	I3WHTiQjJ/NqOU87a7snrtt6w+8dfJB1XqR5JGkrY4YBgHgvdYfSMEPGoz/MpxPFSO2O3e0V8oF
	Zq0CNEUDYUBXb0ZtKvV3JBU25P4I0T588hCdvrbRlVJwII4cjJSGJNaMvDQ/XaHnXojxS4XJrgp
	fifGP8P/YFohpGtoDGMePWuo2xNluz9cxiFai0Mij25zUMpYvqFN1QCDJFro5HjJy2VA16CxZbY
	T9bheeLj4FBkC0fUwzSMg=
X-Received: by 2002:a05:690c:85:b0:884:b55c:aa1 with SMTP id
 00721157ae682-88f166ae40emr969597b3.1.1789407801180; Mon, 14 Sep 2026
 10:43:21 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 14 Sep 2026 12:43:20 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 14 Sep 2026 12:43:20 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CA+Z0x2JTGOsnu7gNPWBfxCZD0vesbezJ7-yhT1sOOuUdmdcQRQ@mail.gmail.com>
References: <CA+Z0x2JTGOsnu7gNPWBfxCZD0vesbezJ7-yhT1sOOuUdmdcQRQ@mail.gmail.com>
From: Jason Colapietro <jasoncola1@gmail.com>
Date: Mon, 14 Sep 2026 12:43:20 -0500
X-Gm-Features: AcwNN1V5ejE6a2Z-mtul4yB0acJd4gEEhzVSi-sicYMYWvTtFUs3wuDZkve5fw8
Message-ID: <CA+Z0x2+wLqeT84WGYsWQ1bPu1mz_A72_Ka3vv9u6RHdtQvc_Xg@mail.gmail.com>
Subject: Re: [PATCH v7] usbip: make remote list honor parsable output
To: shuah@kernel.org, skhan@linuxfoundation.org, valentina.manea.m@gmail.com
Cc: greg@kroah.com, i@zenithal.me, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

Friendly ping on v7, sent September 7. The code remains identical to
v6; v7 only corrected the Assisted-by trailer format. Please let me
know if any further changes or native Linux/USB-IP testing would help
move this forward.

Thanks,
Jason
