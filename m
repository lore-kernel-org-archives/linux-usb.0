Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A630423EA4
	for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785244163; cv=pass; b=YSnBOAM9MhgcpgNLWwvB8QgtWxDkYU0JfP3Bw4KdyzZ7DOxtrDoh49k0XocM/GX653U9wbfJgePMc6a3gI+fcAmkqh60Y6hptT0bdv7NrsWhTR24W1whC76hAgtujOmay/8gW5NSjOypBt81i/sxvMmvY79Sv7XppdkoJ3S0QWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785244163; c=relaxed/simple;
	bh=WW/xZH2DAZNDKZdBA60p3UQPzVbo1xpEASFs7x1TQNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMkHwHPhFIjiv63jzpJk2bvAXD8oWwMFDc/nwOTyxKW8CNzhvgp3VhPW2a8Ye87eto5eEq/lCRw0Tj/gtwMUHUaC2RQAijtqU9px0p15v3Q6TknU00NhRYw5TXbIb7l8SfSS+BJu7YoVwBuBw6KxK27bMX+eFM7ERQQ8338RFIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6Gy1gQ9; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6Gy1gQ9"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso3404978e87.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Jul 2026 06:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785244160; cv=none;
        d=google.com; s=arc-20260327;
        b=kXTb3ub5TuBoVVljxc+NOPgAGtj7I/TXLNsA/IGVRq4WeHv/KYZcXSIQVDqdeFWLlU
         vtvWt/ZtUGEGQFeSDRfBzEvbfvmUoeMFA5kFfbOev3WL0oWaYXpd18ZdE2GILrIedxiG
         mu9W2aVny8KkuV6WE15NBwjejrbKGeVp7p1Qcpa7MhEObKwM3BO00Kg2IhSsdKTaERNW
         khoLigLV5HeIbd9LVtg2pdjtL3qvaSUQkB3uQktVE4Wz3EV7Ex6mBRNQfDr4Yp0aJXYL
         DKpieZ3PqURHlx7ZW6I9TB9QLo26GsAee9n6YQ6VBN5AhZMrn+US49iRTx7UuRM8ZUzi
         lnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WW/xZH2DAZNDKZdBA60p3UQPzVbo1xpEASFs7x1TQNU=;
        fh=JXJ7PMvKJNcjRTCRac8theD0Nen2cp+z36+i3um/C/Q=;
        b=eatB268DafnQocejyV1+kQW6dzz79UKcW0X/HkHBMiOi5V8SV9WpzUpTc6LxHxlJGQ
         ACOXUxqV/QBo9tQyZRcdEobN+3ae3OyexC4p4klxLyPWukz7rM5SgRvQo+9MFE1/ilno
         s9r6jeKkcYZjZSgDOe0zXCq8RZXz2t+JGszUVQdSe3euXx1XQPo+vgRKN8RSEFU6Z8Jo
         5ezjaTlSmsWe3p3/v0evv4V+lycrguQtmjBMPwQMNmZLv0FOdzTUZcmajPHLnKPgj6yi
         yDzQvvNBzhopKm4F46gjA4CrJX9JIYwTCMKXH6+abHHh+L5gMGB21jiYKdXlB77Ut+GQ
         odnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785244160; x=1785848960; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WW/xZH2DAZNDKZdBA60p3UQPzVbo1xpEASFs7x1TQNU=;
        b=C6Gy1gQ9BNJ/OEPfxj+pLjsHXezLe9fpChkh/YIE2fyvfTgxS7Y1WjsLvXizGnMm+I
         CDjPL2pY7MokDo++TJfF+ukENZGvmD2sdo509erUNs3HCbHYiXFG3x96lra/ufMsTtRu
         zjCdczN9evTASwi+d4AZ/vZsedkFxHWiaED66WeUQFWtJNNGKM7sG6a/0+Kz1ibevHT+
         83hu8GDI9SAy5hhTBTEyF14l7r1pRcMYAwrUW08lwrDUj0DCz5C1TFCYDca5+Uskjl81
         4B9T7okJcbONpSr9Lj0FzsobJnWI48sIkZLQnTGjxIWAvEfET0EZk9Vf3HhArEYunqja
         cYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244160; x=1785848960;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WW/xZH2DAZNDKZdBA60p3UQPzVbo1xpEASFs7x1TQNU=;
        b=VJIAiJEgkFUOm1Z2SzHDoFzG1x/+iNXk4AQ6aw3BTAJdmf1e92M9Hp1110MZmL5IcW
         ZoSqhDW1V0fR64fsfEF4iC1u2jiU6Rm9L9qCQrpMeQAUMWHMhECo+bCx0/XWyfHjGOS6
         26bq4FR1fWXvwZKmu25VzYah0B0GmwUVrNdFDhxUS60+4IghGv/0CRdzpK6FpSsimJPa
         nHHL2ue2ryaJdZDQXNhBfLSF9g3385jh6/LCtF5es58HYDPMwuNikg7ni9QTSxi16YEZ
         l+euz7E8JtdXwy8lG8ZUsT/axDD1LUwgq1UyJ6d3GM6DoFN5kfyBJ31GEZFhSVJHVSkZ
         wE1w==
X-Forwarded-Encrypted: i=1; AHgh+RozlddflloeIBLMeXstxubgaNSFDP58Nl1GcCWlhI91LLGnehsKUL49VZe2cQY6iC/0SgSi2/PvvKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIarwPQI+qZsrFHEkeA74VqroMTwtkesz4HvfQcwjRCUtJi+30
	N0J5PCRthHxYDJw0JmsLiwDl5vLcqsh/ZM2VRKuO4V0EEtoMsRQ16V0Rb8weJPCjzSD2pKZjfFI
	WYIVyV+QusXKADnxbAXL3oTx8awr76+0=
X-Gm-Gg: AR+sD12NPRdSxBLWWXdjqmW8E23u9IG7XxHGZGMtpgjolql2KypGYQibuFwnQzK4ne6
	Qru1gchG0IcIPJV8Rgr8zcTi86ImHhoDA6es/bDqs6tx+tRK8JHwmiYAeybz1KQhcpk8gv0j8Er
	JvFHf6YO06mK1jCrHWQhdfN6ovgOFZZj7KYL6pvs3JVXeIx2PCalkR1udJIwhWnMTRE//+FD9Zy
	khtlbPYVUIOQAyqhTfruzK+fitZ2/nA/pdBpAwCtJeqzHKjIxozzaNvcpcymw==
X-Received: by 2002:a05:6512:3990:b0:5b2:a22c:50e7 with SMTP id
 2adb3069b0e04-5b2d025f1aamr513462e87.32.1785244160071; Tue, 28 Jul 2026
 06:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-ax88179a-v2-0-0800fedb2e16@birger-koblitz.de>
 <20260723143420.672680-1-neuromoments@gmail.com> <7f74229e-15a0-4633-9eb2-100fb9cccb91@birger-koblitz.de>
In-Reply-To: <7f74229e-15a0-4633-9eb2-100fb9cccb91@birger-koblitz.de>
From: Yuan Xu <neuromoments@gmail.com>
Date: Tue, 28 Jul 2026 21:09:08 +0800
X-Gm-Features: AUfX_mx7V3gsePYk3FYgpjUYk4nuJ1-IELUE_-DOvSqrglRkvttZ_r0RjorTGuE
Message-ID: <CAMdPb80Jt5qdK_ecsbUh-D6OY+fM_qA6CiAq6bNUkAw0ogTAHg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 00/12] ax88179_178a: Add support for
 AX88179A-based chips
To: Birger Koblitz <mail@birger-koblitz.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 24, 2026, Birger Koblitz wrote:

> If you have time, it would be great if you could test also that
patch-revision.

Sure, I plan to test v3 on the AX88179B adapter over the weekend and
will report the results afterward.

Thanks,
Jianhui
