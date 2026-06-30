Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE0C213E89
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831785; cv=none; b=DT710Ibf126FU6B5uJVqKXkv3H9aa/2BP9C4oY3Pe4uRwkhmsvux1oop8BK/9Rfl6cJkuiLzc140CcR53rk7VWhAmxohKmRsXkeDDocicT9AWZWlHTYgJf4rYnj3Ryy9XmQff0ic9HZEQgnBci6Mmf3CjZKlGQeLhCr+GICBzEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831785; c=relaxed/simple;
	bh=PBYY3NNqxD30OfLDSqkKVfA4pz58nOVpqvM8fLfOqqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWuBt6NiIEVeipaP4sHrVNOWvEtA8zH7Y+WsIqrn7D0WJUekyQyDymN3NWMDQ5+aqS4/y3SC4zVukiolvA7ei1zT8kf0UPdsvJAmbp8zUYfc6XRoqXLOFOc3LZE77USkUJtRuA4WP/erzx9bfokUauGGXdV6Uef9sHyAuYuNuik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n33CNZoa; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n33CNZoa"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so9073997a12.2
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831782; x=1783436582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBYY3NNqxD30OfLDSqkKVfA4pz58nOVpqvM8fLfOqqU=;
        b=n33CNZoaJuTWKxffy0/iYUmBPkasxT8AUNaENKET1oHI1t2jRslkeIIDlWDQWdtZV7
         3amhtSiIt3LxWBU2S1/3SXOJiMya4LL1QaTcij7nnGtSlauuZrDlHaABb6RkwAHo5bvY
         oztGtN8MUt5ItpczEyxOPb6QM7ZfuiLHigCK+kDJfytnBdAh5jUfNUE25xaEWZn+KTcp
         1I4JrPCthW4VIsVPEM/XdJOmU/Z8/zVPpMT2TRZwupIvd5VjsjwS/TrCVqqXKSLTFMyX
         wiGT4QV3zdeBXBXoBU/KSVjGAYF+c4okvn3uKeYw6flJ3jmrK1AVLKMYZEwPXIyGWLS0
         FTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831782; x=1783436582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PBYY3NNqxD30OfLDSqkKVfA4pz58nOVpqvM8fLfOqqU=;
        b=WxYk240hQDW32VSEBkden9xgwzWK4kAjEXPBWaSMSE5Pu0bRylRJJDsAxANEfpieih
         nAZLGiLqNggBGC14HenUtGoE7Csxu8ibJF2Vl5sg+A6tsIqzakZf5ZwDKG9aleDqUcUe
         YMOLrSE+W97fuCLgYhKcdqM0YEYTahxnBHLKraOBA8hTwkGwdF8AWEh5GM6ZnkFkK78f
         k1Vp33YFyPcQPEbMftkGQnYlwTMQm5eiWf4Qbe/p/Ae/qKC0dQHrISjrcCaKeSOHzIxD
         QLIKZgCSTGXKsFwI4tFphKNxTSIkx/lj0Gzp2IubUbh/GXlPnZYmVzlIBY0Ys3jrfXWZ
         NDsA==
X-Gm-Message-State: AOJu0YzDm3CcvOwgn+y130V3/DST57AZKqFbE1xcMnQIAgTxOqhNEvt8
	mXkJ4a/JdnmYyTW8x46ZMcVtAUpFkifcLXAzWJiwp79LlhcRZODc0m8x
X-Gm-Gg: AfdE7ckB8Oq3CHNXcMgQuC8hqBTLuSDM1tKJtwt+CCN156WYWtAqKios7S2IgfFReJJ
	i7R7xxmu4VzTFPeedLzzfkIkIqBXmHbNmJh9u8sHmrM07j1mxYDtPubXjZts6ZBDgMKVB0Biuyh
	m2wohpVLdshvfG8USWAjpjXMvQpeK8vES/PPZ06yrdKGFJsczjf9B7zXwIB8uuIiM7bPAvWrD11
	EX2SiamAO9NAT02x1Ki+TjBIx7QJblw91hzpIvzSJd6WgP1gmfddx9Nlh9mTNN9WrX4OfD4ighO
	Jv3fvQ2IblcndCuqg6MQEOXTEu7vpJjU5vRAwxnKOAHO0xYKJlf/rFL1g9wmVcBnvKx1oxd0f5f
	pF/99D1P8sdl0jGZoCd+coVDp0L/BYU7ykB8aZcbRS0zFNz9JEUbcDMfC+YKcSV4ZORKSOes4Lx
	3JwvLhTB9+FDBdsreWrFiywWxtIQ==
X-Received: by 2002:a05:6402:530d:b0:68d:235a:cdaf with SMTP id 4fb4d7f45d1cf-698876fc70amr700149a12.5.1782831780609;
        Tue, 30 Jun 2026 08:03:00 -0700 (PDT)
Received: from fedora ([78.213.208.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69885c9e8e8sm722429a12.16.2026.06.30.08.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:02:59 -0700 (PDT)
From: Gabriel Prostitis <prostitisgabriel@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] USB: gadget: fix mm lifetime use-after-free in async read paths
Date: Tue, 30 Jun 2026 17:02:45 +0200
Message-ID: <20260630150245.2730992-1-prostitisgabriel@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601-mm-uaf-fix-v2-0-3c942a707bce@gmail.com>
References: <20260601-mm-uaf-fix-v2-0-3c942a707bce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Just a gentle ping on this series.

I noticed that it has not shown up in -next yet, so I wanted to check
whether there is anything else I should address.

Thanks,
Gabriel
