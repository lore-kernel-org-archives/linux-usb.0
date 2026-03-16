Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC74039BFFE
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673322; cv=none; b=mESeJGk3MMQixaIgoUHei3HJ98pRSsasfbwnHpuQ7ZwmYrU8G1AC3LTMgWpHECR0gW8E8UciwdzYTQ4v+fWvb970X20fjG11JAZpp9Q9486GgQ3QeYmqeRtKSCv99Tt8Z9l/hs3TcMgVFjBk+R1nL6+HRDiT4VYHLVymjbEY2Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673322; c=relaxed/simple;
	bh=il0FhzsyMO7Ow6QFBh4/6/fuw7rbNfb0siORozyGmpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwVZtLG8rIkFekcqXaR5rucjwLIWOEh0PDShmhUX6W2EuVFx76fE8h+6hmON9ebIivpCyuF5lM8VMsNfaFWZU/jGfYaRPaM7ym4yMFaTc3Naz0K9Q3WfIR8DMsmB5e6zkzkfdVVfFyWfiG2TavQo8u+s1YmXKTCdFr55Id2kOGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKoPeFoo; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKoPeFoo"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b94a19fdso4298527f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 08:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773673313; x=1774278113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=il0FhzsyMO7Ow6QFBh4/6/fuw7rbNfb0siORozyGmpw=;
        b=MKoPeFootrTN11wewNRVatcq+RJH/x6met7bRCElGekQhbQo9HtVv8cVGfkNBzmEle
         wC55rlBsYG7doUlc+SMGL3CsNWynmLjld9zW/oQiuU0tJg2jfQdMyv0lJfETwFE7UznE
         slTEtrRDyb6OD9+6cChj1qj2WQ0ZOyZ76MMNH2AThAvPzcmCC8z814BM1viK4W+Jwzbx
         q3PGD0xcpjsJ4T0HmaAGFIa8/TiKuaUlOHeLV3c3o1JI7N3KB6Fp9dJ/Pnktw2FdUjNC
         BJ0Q/VK2y6+yHeC+jAtTU0/TgdQNdAqzd4SboAnDiy5RzxZ8KvdOOYD4dZu1yLkqADmR
         C2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773673313; x=1774278113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=il0FhzsyMO7Ow6QFBh4/6/fuw7rbNfb0siORozyGmpw=;
        b=IUyuWKXcuQ6mpI8vWJL/u9L215VLmPWnVCgIYGVAbtQLt+jEJy9vQ9y0uNXMIOBTjx
         v8dyn2vdgGl7scoqtbQ1++fCDJHyh71qhYLfHZWu5OZGE72WRsE1m4t4unwF/s7boqSP
         H8VVkLFK3b8obFmwUZMBon36ZZniunr6y59TeaF4zALSLx7tIbbtnl+zfTQS08Fedc/h
         Bx/a4H5vKg+pn8BvWPbZFMIoZhBB95G1GoQOmcQ/PafirC6oFzizT4pRLv5YNsEFwTJp
         HNceHOSPtqjg6MY26vC0AECd8taJMkByYBl1aayNjQvj3bzknr1UtG3M4Gml+OIi7fDP
         iYYA==
X-Gm-Message-State: AOJu0YwqRV48moi8qgVU+1ZXg37Pjc0cUuTErmULZtIvVZwcBlreaq0v
	8hHe+xA3aM+DPnuwUwsntFGmdT4gH5Pa2Xs7rQF3S9FUq1PkObUaVRCE
X-Gm-Gg: ATEYQzx9EIS6m3zKWqwfTF+/FbFSnfk1GSb1cPlavo80ERjiwYWJC605KB7ZcBlUIgT
	rAQS1/pUSPURh26s2ss8XRIm3g39wE13T5eYBAu8QcGBWaCKRCyDxR33v5e2/33weopZpKAOjKt
	CgeVKxRAwxHFEG/ocMdGlrZ0MqYPGMtvwU/bEaUtPqxPpq33LpjA1fgW7C9HTMbtqbPg3oY+m9f
	8iRbNLeoGU/0MPcgpBzPJ3EgaOIFQQtHJKgDGQLvnups2WonqpiCR42cINrih+ZVtVBobD3IENw
	0iTpI3gLEDVujIiRdn7USAYNuzVYLWMi8k1REf4eRKa7Y0hX98oI0u69d+zqkTuot1oyb+aEtkR
	3jCylRnXDjO2zmMxrUyQVz666ZUZSo3Q+TYBuqyFDjSzHgRLXUdPOpk6IcC2/sfgiVL+JlHDO0h
	EgD5sRUuRiwuUjCuWHVecyvqdQg8q3eDVgUwsjOEBCkUxwwgZ5EZfjxqw0r5o0ZMbfl57V5JBYt
	KyiW0gatGmEHaTM+jK3ibzEX3abGAaLuTrEs13KUdZX5v+RXGLJRr1mXacfq5l6HBKjz8kmrDLF
	KcXksPX4e+0=
X-Received: by 2002:a05:6000:2c01:b0:439:da0d:a025 with SMTP id ffacd0b85a97d-43a04d878c8mr23264464f8f.20.1773673310062;
        Mon, 16 Mar 2026 08:01:50 -0700 (PDT)
Received: from scambox.localdomain (5-198-68-184.static.kc.net.uk. [5.198.68.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b42e680ddsm11780298f8f.13.2026.03.16.08.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:01:49 -0700 (PDT)
From: Edward Blair <edward.blair@gmail.com>
To: heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: ucsi: add ITE885x I2C transport driver
Date: Mon, 16 Mar 2026 15:01:28 +0000
Message-ID: <20260316150128.30203-1-edward.blair@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <abgaax86_52szWnr@kuha>
References: <abgaax86_52szWnr@kuha>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 16 Mar 2026 at 16:57, Heikki Krogerus wrote:
> Besides the above comment, this looks okay to me.
>
> But couldn't you use the resource managed version to request the
> irq: devm_request_threaded_irq() ?

Thanks for the review. Will switch to devm_request_threaded_irq()
and update the header comment for v2. As you noted on patch 1/2,
MSFT8000 is RhProxy, not generic UCSI.

Thanks,
Edward
