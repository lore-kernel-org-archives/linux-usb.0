Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795579772;
	b=F+cmKURsJonWXBHXB63Ri17I7FifoPMpCOsNyanVOSb/W4kHPNTSWqAF6lsY9HCE49Fv
	 TSnektzgMpLNLlA/mQNjL+YRkwsyIC5r8WA6Bi3zPOgtfxDGbxsFYo6HRQpzcDYt9tQhR
	 9H6QzaGmKLEpOv1A4SSoVH+3nhp2AR/ABBt8JC+QmLzFmmfqPLJTORBfG4f2C6bqunI+8
	 8xWBcaNbY9mYHEFRwWjoFbJlbJ+S6wZVeWE3HMEU+k9JU3NRTV3dydgliQbUh6W/Hz21t
	 7xsD9JOCFvRm9FZb6FfBsjvD1zTDcf6flcQymIaB0QSIM/UvzJX43U7BP3WeoEwdUQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XR4oDLJjvjLlqtHJPH2Z7m3RTdZmrnGktJaMrZ+DmGg=;
	b=YFwzBF8yhSguQ/Qg/VLOv9rHvfZVJiSzT+wssNpqDcRCeY1sV9ZUKIoYBRmDLqJ56b5L
	 SnoNZBZpBRFbpNYrKHRgZHZCPr/s+Xw9o2lcMSHe87wjAVJo91X6Q4GzSPMa+3thl3KQd
	 b50sg0xkSHBxCScHzK7iF2pwdW0IVZg6YDcxeEqWfxiT7Q6/gqYbsrub/bgg1MqdhGqr7
	 QDn7ii9JYXRyeKILq8u5GLL12/V9QdVS5X0F9LKO9JKZkJdeI1pbtJJBAbxHXP4EHC95U
	 enL1FMTk0GCCyzGj41AfpQO3IVysOTgVlVbT7T8MK3Feu3IU2OZxO2nXRrVKGucWDqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwakwhmB;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51514606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 04:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51514606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZwakwhmB
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so4298143f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795579771; x=1796184571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XR4oDLJjvjLlqtHJPH2Z7m3RTdZmrnGktJaMrZ+DmGg=;
        b=ZwakwhmBUNFk5iieZQuNuzg1aYv/WU3M6e57aS/xhN8ERjUWlGzPwm4Vj6GhXU4RuT
         M5KfMt2t9wkGnlEFtmxO6DJu7e/h/EZ4saO8H8yUZAU5An49KWFI/pquGlJbGXGK7ahJ
         f3p7+yVN421LRBxmbIkePqSLExjExEtaMkKEqXIuB1g2BUyLeMduhdapnFoE9UDhI+x4
         qQtI4MdDCYzSuPSGGpLRvqpn4RbekVMD3UKzNAdefC8jaY09xl7LhXSAu6iYrb7lsVvc
         n84TkwmDIhen9PmVwU0vTW7KJbxeNHsoid/k/horLxl8mkyD59PrbGhDthSxUrcQ5HhQ
         Hb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795579771; x=1796184571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XR4oDLJjvjLlqtHJPH2Z7m3RTdZmrnGktJaMrZ+DmGg=;
        b=ERifDMEKF4LZps4kQRFEXOEL1vV2ziulvUwQoqBs8wD+Z+EbT5DL+jBPV8l1/MAXqO
         9rmhigdG4zaaHcmrHJ9/ECpFcxHEHStnwneP5bjgH/qKah7gt0o7D7mGCLka9bmaIImj
         JM9T9cyh+nQuDvtxl5+T1ofJZfMIapXLVDDI5QO/kFFW9lR3OfPQHuA3U1TFw7S44+QO
         4VaNC5aKdEd6frzWiNAkNkOFmj0z/B3p8rJLWQhspxOWYNWQiEAZzm7kEbXSQAWuFUlh
         1kMJUxXxJuAEBfvqPt1D1kTniQ9lB1RhauS43TlT0DZaMmPluf3cotOhwWfoPzi1JTxM
         ZPhA==
X-Forwarded-Encrypted: i=1; AL+hErH2Uw2BmYvLi7by/Sf35p+hDmvHPqINbLnIZDqToxaxXabQnzs4wYduO/AEB5CMSivryDbh71t/UUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aADcYQwhnK12i519KgbqPrqfr5SKe/QVitGqxIBqy/6mwuRh9
	XhKr1PfMiyZm7nUYK4kPnEMERYk5Qp4ma3zQoNiS4XSJT99IbzRs/4QR
X-Gm-Gg: AZFdTZf0pfFxqkXwMEoRxXFQXncIKY74QoyNRwPmv6lUmDbB7eAk1ZZIJJNmRQ9P6mY
	Wza0ezClF3od+tohao2fQqt7D/t/YK0brCdj4MlhY+X67tmt1rrzOnlZvs1+fwfCeCmEe68znnN
	kNzgjkoQYtO/UsmBLNtgWNunSkUuAjqhD6sRfy2YrkNwTRCVSsRn3D3WNp/CdZkJv8wNVWbvv0t
	B7rcSxcRJY5PbXQUKB4AjWude7/lNihr5sJe6OFaJOoNe2AKeyVtgFr+OsVuzpeq69pYpBmvX/a
	Z+AmuvZS6LUBOmVLmd20rUPlVfleyXGN24aOScoeqijtJ2JEfKi3GUGfb5BR/2rfMy/Ou48eNJt
	DegKwrqgwnQCERqgilw0q41YzHuwuEL8Ktq4OZdtNU70VlPzTXESu2zd8gGtYPcvhDlM5RaLW3+
	tDbOEBHa3myG1suS5AwofFtSfrOa/f4J6V2Sw48faKxHu3HiukPTDPHXWrV6c4S1EebVlqNvN1T
	CR+i7L7dhlFq4QKeTr0O4P1nt8tAoHy0v4AXLeChtlTzGijZB3WczEgsMzMTz6QQOc3EmAOcGk1
	GfcwzP/IcJLPLc/a2fFAIYnjXXc=
X-Received: by 2002:a5d:5888:0:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-4abb47b0fb1mr31743230f8f.51.1795579770667;
        Tue, 24 Nov 2026 20:09:30 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm29545143f8f.34.2026.11.24.20.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:09:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	olteanv@gmail.com
Subject: Re: [PATCH v3 13/14] arm64: dts: qcom: Add initial Halliday dtsi
Date: Wed, 25 Nov 2026 04:09:14 +0000
Message-ID: <20261125040914.2399053-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-232541@kernel.org>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com> <20261125-halliday-dts-v3-13-5c8311c0b70b@gmail.com> <sashiko-outbox-232541@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 25, 2026 at 03:58:44AM +0000, sashiko-bot@kernel.org wrote:
> - [Low] arm64: dts: qcom: undocumented qcom,halliday-cpufreq-epss
>   compatible
> - [Low] arm64: dts: qcom: undocumented qcom,halliday-tcsr compatible in
>   tcsr node

Both bindings are already applied and in linux-next:
https://git.kernel.org/next/linux-next/c/7ceab1723610
https://git.kernel.org/next/linux-next/c/1cf95fbec47a

Stanislav
