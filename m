Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AD038F945
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904976; cv=none; b=uR2DQ/R7GDySi+2JTkmJ2dj0E68H8uigXw4AWRpXnUgSs44fq33GfjI9k195BVWO+qbQu93QOtA3TAEbzbn9mo8RNS6LD/EVdLE+ZPRAyLl/vsZJISDdxQatzGx+4XWxThVqlqvKwDQ4TLGNPtgfbNJgeE8t90ZkaZi/95Rru9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904976; c=relaxed/simple;
	bh=7FruI+Dvsw923Gy0MPP7mCp7wkqvpoIYW22W5HE/0rI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKjbd+ALzAxMaDNsReHdLtH2MqXN2cPVePv2KF9jgqRB58c6mepq6/ewt8YckUEwuP6TcssTX74sEeeUTEeALTT9yCxZ+rgDMmTBEkHV7KQ6GrGo2tW6gsAradCuNYnbk2f+zQdglb74tehFzs407MRcLpK+DoVK0QJje5p77rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtRrNipJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtRrNipJ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so26915925ad.1
        for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 00:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780904975; x=1781509775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkcDIJRx6OSinr+5cJSRrWVMPrwGSeXex+O9jyO8udE=;
        b=dtRrNipJSFfNPmjRlp23btY8akVAejSFkcMKOnc4ZoWf8CgBncEhlbQzSdvFiNFl0F
         1LefpqbzuxetFiLyrg36OtwL2Bc4/MvWjQIXLz4E1OCanUAlG+CwAPMvWap+WQ7Jem/9
         rBXCH5BLg6DvflIMzp5fGRwFiAPP+H1ptZW8jhb85/nZIv4bu6hdjtgX5zj5XrNWvqGq
         Ifv8POe8j4lt0m8k7HIQP+/cPdMGO7VwbwfkQ7tNBjefswQezWhEO3KtiNuobqZP692b
         nn03hctOCkioWDUFbj/JZ83EbRkxRggTPokGoXZn+PNdhkn/a7mFwWMD2s1MPim238Bh
         eJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780904975; x=1781509775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EkcDIJRx6OSinr+5cJSRrWVMPrwGSeXex+O9jyO8udE=;
        b=eOs2qt7UaUgj8xrgMnz1biRvjOed5DVWV8SqfD+BBXCBzL1Q7J+GSU2TgpTDzrOY3l
         fipLQDFaU+PegSfdDxgAy46p6wmvZ6TPc3YoISaSWhuiasr3+NrD3Wt6p731H2p0hRGm
         +90rOwGZx5KtFxK3usiiUbAJ0TtvIHmoT78IadmfgTO9Nk2IugL5IXEkMRqkNVlxk+Wl
         Fiij9gIgv28hVuLwZliGUPbvxD5bt11AL0//wIF1mPeTWY3RUi96fjPsGlEDD7VNeo4k
         1TPAOAQOdcPsUe8hHZuEgVPH7H+nMJuB40a5JZRg/7Ev5mkHh6DQdCZiOdPMnUdAn3EL
         uvdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zVLCpqlJZGqvpsY68AXBe7ovJhY7YUkP/fi4s8K1CH3Wo9Pt67HSbccPXUFnbqnwRmxq6P3EsuJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy48UMiFC59/LmJCGKVG8et+8q8oueUWypagKmjoApRfEQCClt+
	N+TOUhfawl3MTyIWBq2rc8uimjhEUb9kxCw+J5GEmi9+mAEkJ6vSbKKs
X-Gm-Gg: Acq92OEh68x4c74UxOKw35ckLJ6H3U6X2Jy9T0/zvW80IzNmXvN0mGOT2vn+3++RVMm
	gd4M/25EKBX98PtDEkqfhVlbhl5nx471eNeW/2fItXpjhtTH2iAkm9zIgfqJWOyDTiSWvunCZPn
	aou0M8b/FEeT2YwamvYj9M8gFWeRwXEWU9pOpfbfxJxeUiRI/NP6uzKh5loJrTI0xFbWf2WStz7
	/oTjWwLTm4NqSJ5qrJICrudd4/lf0RVgTk8zhauH17Uk0L0oet1SLucMZY+J4Hm+VK74XalT0I/
	Q/F9QjH3a7Wc7XdB80okUBYHEgUix0S7UsEsJN9g4B1oPar3MJOlYI+fvxaPCKFO0GaPzo0ddHO
	2c4WSL4lQPj8X4/h2zFQzSSwOnDlgeGi5boTQYArkZlJtN6+2X9oYDcuKwnRcNBl3GeMPNm1lNX
	KntsTmC+G2vyg6HPOVw6IWn0GVQffxY7fhjAp9SQwBGGgDMTCCN4uoBQp2YIFGc5wsbZYohbyxP
	S3buarmNdmkJi2xb95IeNalIYk=
X-Received: by 2002:a17:903:3845:b0:2c0:a711:539 with SMTP id d9443c01a7336-2c1e7b3fe70mr172755345ad.5.1780904974861;
        Mon, 08 Jun 2026 00:49:34 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2d4sm160157485ad.77.2026.06.08.00.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:49:34 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: johan@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] USB: serial: kl5kusb105: fix bulk-out buffer overflow
Date: Mon,  8 Jun 2026 16:49:30 +0900
Message-ID: <20260608074931.5911-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aiZiZy8a0al7xVXe@hovoldconsulting.com>
References: <aiZiZy8a0al7xVXe@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Johan,

Thanks a lot!

Yes, I used an LLM to compare the custom prepare_write_buffer()
handlers in drivers/usb/serial/.  kl5kusb105 passes the full "size"
to the fifo copy, while the ones with a header or trailer, like
safe_serial, reserve that space first.

Thanks,
HyeongJun
