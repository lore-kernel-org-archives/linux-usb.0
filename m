Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1805D41DDF8
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785831922; cv=none; b=LSKhASZzRrP6aE1Qm9EUlH1PCQ/bq6ljP2E24CGIZAHWaTp9gwwDeHHT4Ui1RFdewU2naFLRQYz6l1Eiffc9oWYTSV0F27UhrV4PKkPKV3vZfawYqkuJRHcimjn+CgkzgGp51FiQhAM8uqR0JpYl2uPgi4jdoAcP381PQuHn/A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785831922; c=relaxed/simple;
	bh=AC/hjKF1VPu1YX1L60ydQLw3GJ+ZgbFwpNxSQpnhjbk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pWxnHXy9ptEALs0wlLkwQcsNUhO7E2KxnamO3pqAx24wAfXEo6pt4uk3MuKslRetqo3jJ0784zK6UTDPa6s62LdbjbxBSiwptsvsNxY3/HglmDk+136WmdUwL1zwNTW8ZIFIgP9U2M9Dye4NwxLBBzGmE0CTq2X4QvbcnbY1sdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ptrBzMVq; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ptrBzMVq"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso3076094a91.1
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 01:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785831920; x=1786436720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AC/hjKF1VPu1YX1L60ydQLw3GJ+ZgbFwpNxSQpnhjbk=;
        b=ptrBzMVqhv+DljM7buZdVlut1jcojfs96nS3sfLWW2OObFEnieMW/blx01gvcvOAWr
         bbtuWV2gJUe7S78c68iewMVNtnVfcHJ9/JwLnYK1jXl+yGPu0Vsww44XgK6C5OfZUvdu
         klpPrs+hNgaOP1zOyMKYIl5ksjrzK3TgcoFkHDI19uwjs9UuWncINenv68/GOUepfCTT
         Qs9WG0sPDkEC+CeqfODVBH1upB0vE5v8d6BrkEB3ZUtB3NUj+a+rpMy1C56fOjJytJ4f
         TsvzeaxoSaEynMemeTy+Y+z5gHTrh3MvmTnUs55HyK5WbJjkSyimueqRbNl1FX5Grb1k
         SXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785831920; x=1786436720;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AC/hjKF1VPu1YX1L60ydQLw3GJ+ZgbFwpNxSQpnhjbk=;
        b=ZZpCKcf9OPvvRCDJ01Dsp61T4jZoTeG+Lfo/Hw2zwQwwwL8p1X40mEszon7HHvviXR
         DfEwZup8UUgcjcDX9XR0/zkwyX5Djm1zWTsDxJmFsM3q4gVcqtD6xPMKwmdzsKUUO2P6
         T+aURnTscJh6mR/j4Npq6Wh1w0iy2jlvqUQ/DXxl4l3Gpl/zErGpO5dFnS6isMzRm3bN
         8ZnAp0yI91PMGauiYgJN5YEY73d2hxW/Lu/6Uw+JwlsafqoJ1Ezfv3hD3vmX6aofmhet
         ob/M9WnytKMbSFRiSYDof5hseVI8Jxj4MKnpbp5rgRFGF1E9pFtX4cyWm6I8OqyO+Rev
         4V8A==
X-Forwarded-Encrypted: i=1; AHgh+RqKPdXMZ7UJaIWt4QmZUdQ3cPtTgSVVYP2A2KGeHwF7tg6ebTeMh1725yArIci2+Mua3Dsl0ZMp1v4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkvGNwnguQ57MGHlpctacEFXBzC2SVfPvKuizyR8fvivCjP+qz
	xafyCG1VlJX7q9A/ijqYwGOFe4TrgwLn0h8k7wCM8GqUdKLddvDkcJTSJ160xWpKfq8=
X-Gm-Gg: AR+sD11bVaWBifsM+zx9c8hk2RQ56DOlSH2x+Tgo4lD6KGIRZ1UlvcSbnEMyAP4Y7Vg
	w2xOX7dxtB5xu6Bf08HNNpw73jHtQxANI/y6OGHeQBwv1sPg2JFegFcdq0wbg1+3T9SUIMY8UKd
	wKRm9QwASe9lrNdsey89Zn+RN6KrKpWZYQd90EI0lkNPz0gV73QGgpeBUart6s0Ae5TIXujpv/T
	0GmYLMUhvuJ3v+T1rIwOK5SZE8CCQ3hWkLeTRvGQjvGOywpx2dZZaZGYidwqZ3cu2bgjSg/EYMq
	Ru5FSs1VCZ7BBTGopVgz/C9C36773uWL4io2nwMkN86a6fBVfgwsmJ9MB46SGYMriyE694eCgAy
	z/iBTiktql5xwDhB+9FYLUc+NgIYPc0d/VUwF8osC1tRQR+6vmjsh40P6cLHHl+GfzvoTLSghsK
	GIXYcerLGjynwDfd1KfJCWBr8cosRDqoswqQxKZeKlycX25TK2LO9JMCchOAiD5AM07Ih+4Bqj5
	0vTRaefKcqIOg==
X-Received: by 2002:a05:6a20:7faa:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3c92a5e194fmr12278054637.27.1785831920331;
        Tue, 04 Aug 2026 01:25:20 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673bb38sm1991561eec.14.2026.08.04.01.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:25:19 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Subject: Re: [PATCH v2] usb: gadget: f_phonet: fix use-after-free in pn_bind
Date: Tue,  4 Aug 2026 16:25:16 +0800
Message-Id: <20260804082516.2924708-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026080420-grudge-version-8bf2@gregkh>
References: <2026080431-paragraph-caloric-0aae@gregkh> <20260804074432.2906951-1-khiemtranzo532001@gmail.com> <2026080420-grudge-version-8bf2@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
