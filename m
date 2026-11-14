Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794691849;
	b=L0KJpbL5nlT9pccWJjezWkaS3bDckjnuJ3Vc3QF07LfU8oTI3XA7BbbjfKR7EX7hZAvi
	 z1dX4iNb4awViv4QEWivoODqxq5ePKEvetLMOQlnizg1HlSzHmIDbW1nmH6QFKxcgRT7o
	 RtXNQP1aZzZqJr+t0/Zo7to0G9I7P3gf2vYff6A6DOjc1VgFQAl+5mynNt9p8xDvwbK7K
	 hBcz2JqpgL+qY6edKS13W6MGUafCYvTwNT5p7uojS25l/hxGyDImxc0dQ8a2BPw7Ek9im
	 fZo5cq3SYej5ROFFWoQqoxYRc7cVy4aw/pFBv/1vxutjk0cii4X7Cv/EuYrBnHZiZdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794691849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
	b=pgoNy4JH8lecjfODCJoHpFSokVjOucg7sn/wWGOx0d/lEaErIvPiarur9PzGxQEZ1o+I
	 rdL/Pztj1Q+PxNLQNLXE/V9/h+tLbLBfjM8iETR8VFVLi4CQBiNfnk5tKQY7v7YtoWafA
	 uKdEzqJGAyVh+N725xJr1TT4Qz1A1NhHdJo3IDoLLDLWqFCWTBOafqdn4biQWTwAVVMW2
	 0+3sl+EQ7aeaiXnWPnhxsD7K7bRrimf9ZrIYSNvPpvV/N6m7R3XvolyLgWS4J6n3Qe+O4
	 dMz6LVgMrP03n+5zv+JRZZ7oGl2jClg2i5RcY7GCcH8upTVH7Oqw7vwkI4ICvs+27IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWlSLmZa;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51BE606A330
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 21:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B51BE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWlSLmZa
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so22067595e9.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 13:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794691847; x=1795296647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
        b=lWlSLmZaPq3CwNa2GvJ5HLBZxwrHAyR4KYWcNLYDoejqq+bHE47WezKQusTce17cqB
         UTWjdD/IlmKTsXW86lcI5Re+obIoVIb9t86LrcMAeziz9eDWUmhlf0tEDJWLXl6iumFV
         A0KOTfltxQB7iH/1NZqAz8vQsctKFp7PZfZL10agBOyW0+/+Nlq4fquLxNOefQolK0q1
         7b1VyBrgPTzn3K2O93/7d5x0teNBV9W1gjmQsMpDfJX8yxuUQvPJ+6K/Js0FjGNLg/bj
         pddRJxGyyKNTa55ItmUV+vqh3pU2XKCHu2EjpM7+mnWtIVQHlY7yLwHWBA9Qc69Hd/il
         +DeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794691847; x=1795296647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
        b=yMwcvQ1U+9zL6Bf1SUfc23CG/0MgjoUVjW90OW29u8WyoFpRd6MM1h1FWWRAPJ3hwz
         HtjKspjXXJ8m+Zn6S8mK64Xg9g4jG1QHBAMnFKWfb+AsTboRbhCjOyfrAFx2zMD4XPNH
         7pQ7TdLkRCKuF3gSlzAY1AWwDES9MAWOjdtTzVaNIsWPIu8C4R3kvvFD9eJTomc9Ajwf
         jybtsmCuFdtmGdvo2Y92TBLyaSQrv4lpg7fpMcZlxM44Jh7tgEZfJ6Y9FlonY7l2gkVs
         YcLjTa5AnJDblsz75mXjWwLdWpcfGW0+RvaVj+2G1RMSuRbKsYSPPRx27PoRpQWwiKfu
         M/ow==
X-Forwarded-Encrypted: i=1; AL+hErH/oSi50p8XCyJyxwpKVU4HZbJP8gSyHYNomEfPOGo57z4g5WpvnZMtSeubfBKr+tpda6f9d/yAr4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yoxbH8ehMbTGS/4Kxv7HR+Qk5bKkZMtP78jMjsH56mmShTb6V
	+4Oh+z7BR5FrsVRB0Qxjf8nHqjqlpekDhutfIlFmLA8a8QhnspYWEQqpy46kve5a3gI=
X-Gm-Gg: AYBFou3mvmGC9eL5i92IzI1bYxx078f02RNJPu4Uqg6pjHoZ66HvWwabNKSJP/iZAFt
	7Jmqp3gj2E2aIEgUd+XFiGzfxPa4hv8NlIQ6tVCF6rKL6jPmXyrevVPUrfXPcUpjjxO1g6PCHwG
	i7TEvnAEmY0RPhT2pSYkAlMRYi2/PA16ZKDqJt6aXUTdQjdBc6vR5Xed4lDv6+zg9mQqLIeOgrG
	BRy3T+4NvyPMjwCpT01JGYgsR+y09ASnSr7JDPz1156x9hMn0y46PX68IUiDTNbyB/1dVXJJHFf
	3gdeLgUTgsDWS2R3Yp0EwWvy9GnSoitt/G6FjZL/WF5EkngZIof845Nr4S1VkJPdDrqwAJuOsxB
	bg734uOmy7+1c84QYc+wYP6TzlPE73BkCli8dSslGq6XACYiHzGKBh0HaVlGJz2OFuVLEvSf5B+
	WZKVHdN203kgKEt9vJe9ZV0BeYdMOXt4Ex6O//eoVZt6BD/GBO/bv/jrtczWoR8rUk55mtW9yb/
	fcmzZKj4/QDe6VqejOFopgJ+/Y5RfnzvlKJQ6Lithy3igoqB/SZ+DHlZ6RvHuIHFxEjVTWP1MMF
	SmhCNwUY1UFa4VvL1fkRfQVMQU4=
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr187322445e9.2.1794691847097;
        Sat, 14 Nov 2026 13:30:47 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4e2esm12803478f8f.36.2026.11.14.13.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:30:46 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
	Lee Jones <lee@kernel.org>,
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
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 16/17] arm64: dts: qcom: Add initial Halliday dtsi
Date: Sat, 14 Nov 2026 21:30:28 +0000
Message-ID: <20261114213028.1933448-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-16-289114ab8197@gmail.com> <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
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

On 13/11/2026 13:10, Konrad Dybcio wrote:
> Please add the other idle states (D4 and E3) from the downstream
> devicetree and match the order of properties (psci-suspend param)
> to glymur.dtsi

Thanks for the review. D4 and E3 are already there, as cluster_sleep_0
(0x41000044) and cluster_sleep_1 (0x4100c344) in domain-idle-states,
just above idle-states. In v2 I'll move that node below idle-states and
order the properties like glymur.dtsi.

> Please use '0x0' for zeroes in reg values

> Let's break up such long lists into one-a-line

I'll fix both in v2.

Best regards,
Stanislav
