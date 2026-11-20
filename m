Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174464;
	b=084COgvUHnQudVI3BoL94Uf4G6nNP5uoKGfWoXDTwafNtQ9Clt3mnOYI8e+sQclx4w1A
	 IyNtxJDm3J7fImR03f9m7d8tgkeiCey62cZYL8euusBn33MM5JNx2pme4heJuvBKovTi0
	 AfdINiSlfWXRdEfOXlJ3OkdlR0jKpNE/AZzQVl0yR9aHtbvKoPZtmWC9iqE3aBIfMdRTT
	 5YGFlcE00OxJUhENQxXXx35V8dExX+Xb/6ugm9E77AcrwHm/GF418JKMmJcDrV9uBAbIi
	 E2CzO+bo+UZCUQQ6mVh7O4S9Qr0umyaPULSxWTGQ1ROdMd1Jy/AYE4ydouGkFC+5/oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
	b=d214U0DSBAGny6JYoLmJTFRiscxcCKMY0GuRriLpm71sMgdcUyaqOrxYmTkSZTc1asQM
	 BXOUry+WMO3omxPpURPzJmxOpXPJma/UeVzc2rqZ//bawvthJsZZ5V9J8WAByofNgTn5b
	 83uJ6kztrlxzmRqZFJRzP9wPviubqNFWt1JzSzZPBqP5ew0nz7wQbyveS210Abr7Buam2
	 oGIwBvwn27HLmFng5q4oLZ0N4GmN0fRg9WzuqSQMF7Clnl9EY0mw0/g7XeDrbbHn6dZ9G
	 5xoyG3HXusbzLD63BPnZWnYlPS295PX7tCY5TwicylwvHwgT0kNY2C8lbcHMvDGOa1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ib0TCad1;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACBC606A333
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 11:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AACBC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ib0TCad1
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb2893531bso463354a12.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 03:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174463; x=1795779263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=Ib0TCad1F95Ie+xma1sMys7I7UCPQQc4SOoNtHTOow9PYPTRSZfxhOEqcMd4S3UPpB
         xOIhzinkpw2Uq9t7KO1a7+CaKP42943VIelv2oiikPJnJ3n/Z85DYMgS0T79LBkB/QjX
         ZRYReuSsBgxh7i3dWCat3I9kVDijlloz+UfTOwKz1wNsh9Bq6U3vw0pppR0RuH+y82hc
         qrG0JnrTDkjodnqFTcSv3H52DCKO8NwdJOkfx5xNQwfrG1w8k6AG4Pxxjxe2bjVcXfpr
         MyDBylv/ON/eHQlmZuDyBrVbBmCLVzvCTJ5SIs+ZpUpEanFlyi+od+4/CcKARe2mtAVC
         sFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174463; x=1795779263;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=kQISSskh2V0CF+e7S4urSxWjMjIsQIQKWUIWq4FZ3lsC9psCeV+x7otJyju+B6gx7E
         qMtHCzmJnhjqG6aIMd8gfkLcKoxXpWwbgMCXQUQZk3SSWY/rQnrZjjvCmkclnbXrhL+m
         a+SKVX49Ox/6eGgL5ldAzIKmrhLrs6Wymaeq2tIyk3a264cwwQfTvWQpvIs5WueMWRTs
         Q9ol76MlbHSQ8nHTGsC29af2fokHLO58MJ5FKm4HV7DAmkjT3i4v0p4XEsh48sxHzUuc
         GScl8ixa2CpnJe4b7HcBpNq0F7S74/Cv83Gx1/AfEXo2TyWW34+Fr6Bs0qdLD3Pd78wO
         iQ6w==
X-Gm-Message-State: APuU4Z98OFZFPDslWrsKTKuwATUDS29aXkj8F2hk5DKltTXgyeiLY44C
	uxdNK9igoS7eQXEcnwP9FiQPlGHCCYQmFIKGTrs546xQ4jHi/uPQ0PLUTG6cnGvYFu0=
X-Gm-Gg: AZFdTZdJyt+2IUQhs7x2PzxfSJHJ3F+jRaO7LEBqmZZNiWjPNcqSDXihMjw2+KYXr+3
	jhLdOH6h98ezSgx9FPKISKsAY3jNeYaPECSItJ3VFRs1dwc4dhnJuQWCjd9xGyR50ajEZCfhDm6
	rzPGvTbHWedyMmBEXzm2iHVL04meOe1cDXZIK68g6GuWxb5GmtkG07/XZpmmmPgSm1M0DfAQ3Wg
	CbovdYDFuEhqIKHdm/dJxaTxmZC18dO6z7+abOj3Sno9bWn96mCRqsWjcCLnBJCCPOW6ckdBH1+
	qMUmGNgRo4WzzzXuGHvBifXKd1Xp9LDRIDXlt0yjvsvab9ZRecltXje/q02Q3yUFZhBnPCesNAY
	1Kd6mSB3GD651tiLw3h4uDDUcwTgXgx3a6rWADk3dkaFao9wuIjtaGR79sM83voxyy6WigkEcRQ
	/lB1TZtT9D6UcGmfk+shsdRaqHZx6dVHZXtN/VAMMJiHg5077WnecWX/FpWNxZy6BYoq+JvhGjx
	yDafAsVE13P/vBNngi7P3b/ohSg1pjEgXZEFvyUKC3C5WbIoCB2sQeMgQiUmY9Lv0kJu79xDW7B
	qVePTEsm7o3bZr7Und2ahyNkncEcGciuw1TE80KESIemoQs+YW64aCfqTprSCTQJBoiY4IrgPQE
	G83saCrDsnMM1oq6qjQJssKebr19LfgNQPszp
X-Received: by 2002:a17:90b:17cd:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3b41c9032bfmr2325880a91.26.1795174463114;
        Fri, 20 Nov 2026 03:34:23 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad47091sm4117971a91.10.2026.11.20.03.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:34:22 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Fri, 20 Nov 2026 20:34:17 +0900
Message-ID: <20261120113417.3069190-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013005854.2470384-1-yhlee@isslab.korea.ac.kr>
References: <20261013005854.2470384-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
