Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27440371D01
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 05:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788757486; cv=none; b=ULi0ICz4O369F23QW5gkXrYr0b/hnQ8qE4RZjRo+Jh33uW3gmgpPPt+VZNuxefpYeX6xeyVYVHf2E1LZXYtQ5pJVVwzLuEJR39ivsfm6ojsWj8lml5ociJoZlrw3Qj0GJvFjrVCJtlqL6g0Ym/lojTFDHjDsgZGwaPBjtWN9rck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788757486; c=relaxed/simple;
	bh=dvzWV6uPH6nNpcqdcxfnsLvgt9T1LDV1zM8g+XqkO58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPyaQBnmPjSGf3Lj7YTVxGG8/2OgQO3uDCDYPjNOW+2jSfmVNACVYnd7mDVlqtkUZu7rAqJnVwkSDTWBk7Hb3aVzzE2Zwxcxwhe1Z2IyXeMkT/ez0aES77sbbw1ypnmWeLonybs9EXY7zp9OD7J9l4O9izvMIPYFw939YwENgyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jF1H5j/w; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jF1H5j/w"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-852c481415fso3567713b3a.3
        for <linux-usb@vger.kernel.org>; Sun, 06 Sep 2026 22:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788757484; x=1789362284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iaQChxd3RaTTS2M89yBBd8Z6krjXqSg7X3Hqq+Gd8is=;
        b=jF1H5j/wtjWA5ZkNeKwzOgarYKJtCap/ZqXJhIydOv3c6yqkUDldwMCMDSfoJyAevx
         xuihYxbGtxlPDCYvGxgxYjLYo35vUstlY3I+yppwYmw64YYufr6UWCTHWIAvnWynrmuC
         U6jJbkDWMVgPHo2kTJjXjBAmJQHzIrUsJTbIwz4PlqpZL+tHh6BVWcdhg1eZvcQJY/9w
         brB/JYQRkyod9wn15PXi/r/jLFJ7P5iJ5zEuQUi9A2CyjHFJfJ5Glf2ws762dNYIuBuq
         LLErjXcELJaEwMm+sWoetcWvocR3dnmI6knz0SDQAzr4DoLZNBPuyjFPzv4T0cnXDr/k
         ZZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788757484; x=1789362284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iaQChxd3RaTTS2M89yBBd8Z6krjXqSg7X3Hqq+Gd8is=;
        b=YvkY76rQYgz/L/SV36RyA1Qvlk4yd6bceL3BCH0CSLE7cNmHXce1cqyC9Yz36muKcL
         J65M5zV3C7fgcYxKWyUh4VG8AF9kB+NcUl2k3mYjxTkQg//23cH8whRjjUomW1i+kvyH
         TZ5QxyG3eV78CAzNlHtlPlX7Sm5gpIQsHRg03tmBNeOA/YsGE1Ca6bKMEzL7gTNhbLYC
         15CJE7hiyeR6FK8QmwgaPfsplpbQZBi0TLA/ime93Y+2rDlKe51gbqSrDAovtjSiYZYe
         u19OKiTOT9jdMbDnuyq6olCHqcGfP6OGA1MCbgywJj8k9hV4Zd+nHQqM++jDlXGaNawy
         dsCw==
X-Forwarded-Encrypted: i=1; AKwUvByoJu+fSbbFonV+tDWMGL0bnfxz0f+28+YxwDPglAxYv/UJkAKeJRcRykW/DvgTJ7cQQ0r1h/g2QSY=@vger.kernel.org
X-Gm-Message-State: AFuF++kxqEtASSPxQ+EsXh4n/TN/YtiQfcB6biMf7YjUwZxWb2GfRhRp
	ZX+DiJdmQR6TTxqk8qeD62HccwNNlFeBHJv3EpIBCwXYBcpCYU5BHaSU
X-Gm-Gg: AYBFou2sKYNndgqvdwEZaojIwv/AwHNp/kUs2DmdslxUJH4/b/DwbLIuRpgVgaUf4bO
	ubi5wLzH03UXC7RqAPDsy/Npsnj68w5pvnnKIDCtU8dfS1MyNFKQ7uXKrzOYdmICAxieHnW32IY
	LQ/BvMEU68hpGfYhzVOwjl6ezWdaz+fxaMvYNtGlIOdI30OJlosmycNiw/Z7xG68HcGIl/vk+up
	63CmPY2d/2y6dgnE/O53gUdNrtZgbj+TBShnQl+xuyI4Ny8tC2qrFFh1mhf1bKzSG2JBqNrwe68
	We+4DVGo59kmX2MUw5jbd5nyQlAT9iOwZHIzOh0q3coNJCA5s1VJllxlv2aLqxO4o0nfn0Cf650
	d7UI3a29xgNMOZnYCRdWCXANgkorQMKbiK1aJkXEDWhQtmzERULRnVWOjQ/+9NwhIP7XAIRIRmr
	SH/4u3/bE8PNtP3iczSa3wB1S4laY7OcYrJAfzVtV6z4gcVUocJUNUxvgEzg/j7br/yMexIUpTV
	tD5Ugu0nMm7y2wilbCM7dzw1FGH/Q==
X-Received: by 2002:a05:6a00:9514:b0:852:131f:b9d2 with SMTP id d2e1a72fcca58-861677b2704mr28394845b3a.2.1788757484351;
        Sun, 06 Sep 2026 22:04:44 -0700 (PDT)
Received: from Inspiron5409 ([2401:b60:5:2e5::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615203e041sm3885072b3a.17.2026.09.06.22.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:04:43 -0700 (PDT)
From: Jianhui Xu <neuromoments@gmail.com>
To: mail@birger-koblitz.de
Cc: andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	hkallweit1@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	neuromoments@gmail.com,
	pabeni@redhat.com
Subject: Re: [PATCH net-next v10 00/15] ax88179_178a: Add support for AX88179A-based chips
Date: Mon,  7 Sep 2026 13:04:37 +0800
Message-ID: <20260907050437.1345480-1-neuromoments@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f56aa06f-fad7-4714-9c54-846397bf2438@birger-koblitz.de>
References: <f56aa06f-fad7-4714-9c54-846397bf2438@birger-koblitz.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Birger,

Thanks for your testing.

Using only

  if (link)
          phylink_mac_interrupt(data->phylink);

would be simpler, but it would also discard every hardware link-down
notification. I agree that we should leave the driver unchanged for now,
since I could not reproduce that event in a further 90 unmodified-v9
cycles, and your 1,000 v10 cycles also passed.

Please disregard my experimental patch. I will report again if I find a
reliable reproducer or evidence that identifies a specific driver problem.

Thanks,
Jianhui
