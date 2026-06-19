Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5583E2F8E98
	for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2026 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781859893; cv=none; b=rw9fb+fGkyBxs5QvXCggInHGMv+aYennjEZmftx/lnbuYjV0g9+xWhaiHv+Taflq7arApc/oH3uoTjtZ5/ilkLmr2yOns/IjeAMeEFwyh64LAnI4wwsR7NVP4bKAVI0oQ/7pcJNXl9A+qsgJF2Buva0PmJG6f7wonMycwtLFzSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781859893; c=relaxed/simple;
	bh=AQayZSv8LiFNtJUg7nXjei5rem8CAOvfpAdGfnzRXxY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hEBbv1dvU41ETI2WlhTVbHsx3aH0Nm1tjSBh5krqfOvhrI3Iw73i8yPQiJ/Os24FW4/nzIBQvXokWd2woiRNbfq7KWAZdtbGwx2ZGyUD6X91+5irOGmKAHy6w8VgMmYziQG64TJW4yiKIB9w3/M7UVokEcOd6BsmVWPxQzgk1aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEYqAZee; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEYqAZee"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so16501265e9.0
        for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2026 02:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781859891; x=1782464691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvPeX4rm8LDSKuRTQPiG1oQWnoxsH14o+aTlQ6C2+v0=;
        b=IEYqAZeenOdx1KkkRuoEQtdu35u+5FqQw+sE6yCz37vyjr3YezXuRmImuaPmbRMgZS
         hBYJUdmVft1tPNjJor1tGZWO0than53vVU8N8LredZ3Ujf8O2XhlKjS6Ru3U53uNyi7a
         x15vurk+FFAOv2SXMihU4iFZOpAVIgNR8WKH64GCpKg99r6VQT70NNyPlI+sQdFi1gIP
         q5Vor3K2PVieJBwOTqc9Lpifhj3oBYhJdqi6rGQriddQPfLtpPkLxvYKjznGZJm9hEte
         Wfrg3sWO9CT+jzLD1Ti7PY0sggvRDX7PacXActzuWooJ3SYc8AIj62++C0oIg87954b6
         U8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781859891; x=1782464691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NvPeX4rm8LDSKuRTQPiG1oQWnoxsH14o+aTlQ6C2+v0=;
        b=TXfogINXmTBscUXzM66q9lp8+grmwb6sVuDtb/6nMPZm3R2b3+MYj/cyYD69cx6QNR
         mHnf1UuQ250r206S9jwXagYOugyHWwzL8w4XB1CiFmxBEDHSZKz8dz1fN1YlvVIQN+Ep
         Thp9x0QbcbAhkpXmDjthRkKCgfagI7h7dbAY4xeu97JoAkDv0pleolp6R+VoErLpXAhI
         JsiOnhgaOgwofxi9qmLSYgNoa0AptCEKtRyRw4SDjO9+OlhrHA+Hwz/CBhnqZBbEUrHz
         J8fXTXxX/Warhl8EVIf4s+fm5UzSXrXmwK7JEmSzWXUEte8MC+Xpz/s0XmdKkgzepDAD
         XsEA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZJDyhSwBltn2Q09Lo8PAFYFqv6GGezzNxdlHS8TZ80KkI+PYXmAliHU9PafEbzS0BM8cH4RX0CFA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Eak6Lf3L6YSLq4U7FhbxDl7sv8+MthdUlpLl9nN/QIj+jTDn
	979jkuUO/U7xVJR0RtfQTgGF+LiJISLqzqYtM6jIUDWCws7MsP+Pesum
X-Gm-Gg: AfdE7cmrtTS0Z3hhEtAu+4X5JERfsU1xiyBVpMgH8tyCr7GFdkTFeAz58so87L0hExu
	vTbrOOiqpS1CGDtO7Mbp75k5Q6kf+dkZoj5z2MfNHeCxngWtLR2773YCONy2yrGyajcDQCscWM4
	/bfB4dQq014sL0Ba/1YTyyXlSSEB4uzj+UHZ3rIgpmr8yvEnZmSKpzS1Mi8666b9Lf13rlPGFI9
	bjMurydKP+771KhW0cIuZSh5GyXaZn09ycnNk7Ia0YmcrXTJciYIXS/57M4VYwilpOTMLu4mMEO
	DI/ipOxUxCR+afpcIt9lwcEORhLkxtUVp+f8GP88cQX5TgW3yIjCbK/mlXsJJa9utWIlqZU0OfR
	xWR884FAQGsOOJY7dz25XGLzsscX1mvZJNwZV5NVqS3VzOUQA8T/V92NrXMzO/d+MUTYahw94uV
	yZ8oFQF2IzYgJ8TzYBZw671A==
X-Received: by 2002:a05:600c:6c09:b0:490:b8d3:5dcc with SMTP id 5b1f17b1804b1-49240e5b499mr32202475e9.19.1781859890525;
        Fri, 19 Jun 2026 02:04:50 -0700 (PDT)
Received: from foxbook (bfg19.neoplus.adsl.tpnet.pl. [83.28.44.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fcd7027sm54074305e9.1.2026.06.19.02.04.49
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jun 2026 02:04:50 -0700 (PDT)
Date: Fri, 19 Jun 2026 11:04:45 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Amin Vakil <info@aminvakil.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, Tao Xue <xuetao09@huawei.com>,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] usb: core: interrupt-IN wBytesPerInterval fixup
 (727d045d064b) breaks RTL8153 in Lenovo dock
Message-ID: <20260619110445.5ecf05fb.michal.pecio@gmail.com>
In-Reply-To: <4e45e34d-31d4-4117-9277-36799e63e6f8@aminvakil.com>
References: <cbdeb118-58c7-48a7-94a0-15e5cdb5879c@aminvakil.com>
	<35d2b455-382e-470e-acf4-1ab60770da90@leemhuis.info>
	<5036fee2-4d00-4ca0-aeed-400da64d7872@aminvakil.com>
	<573bbb08-0ba7-4f00-8996-819cc1d9cc48@aminvakil.com>
	<20260616183646.4798516b.michal.pecio@gmail.com>
	<8f862eb6-adfb-43a9-b4f5-8f9232333b51@aminvakil.com>
	<20260616232027.10ba0415.michal.pecio@gmail.com>
	<4e45e34d-31d4-4117-9277-36799e63e6f8@aminvakil.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Jun 2026 21:19:37 +0330, Amin Vakil wrote:> 
> The problem is something with usbguard all the way :)
> 
> Disabling usbguard fixed the issue and it's now working on 7.1 
> correctly. Sorry for the noise.
> 
> The problem was a stale usbguard policy blocking the hub, updating 
> usbguard policy with new hash fixed that as well.

Well, OK, thanks for letting us know.

#regzbot invalid: configuration issue, not kernel bug
