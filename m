Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795228845;
	b=H04Hk1sdKwm0G0RFC6dhSYBqaisO574PSdQ89GlIoo1zOOhJiSZRXHlxLayI6sBR1vM8
	 /2yLPFquoS84x79HQenZeldFNBCUYvKbUiLCnDisEAzr5otj4avCS5/BRckMtwfGCNCmM
	 HOvgxP0M7Eo9AfwsGUe9jNx6pie6oE/luPOCfAP/fCL9dZwRmpwPASRSSGCtCP+8gTrig
	 6nOXq2i6wOmacHQ64BsJWRtaBPDGGJZXISNgqcANvpLqiZf8RG5kkREbt955tPF/en/5s
	 SQI1NfUFTpR8JTJLqteKdz6yvyi73oApBWnHgc9PTE2gnuyeFIuGSKP/YlhSE3xtUlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795228845;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AspWSZaXoizUJJjls4URc9TgIfvwsUTUVtlg6DcwbFk=;
	b=3p6RZhST2ybjfw/ty3N1fP36LoCWr+ulIIe6p47Q1Ez7OhlpRI+TE4UTZwZctU0tC3ey
	 e6p/WTcE0Ct1eMY/axmo3dAvNlytdXl/U2HHip4s8jSkxS/aW9lRWj9qzqHlDjAKdVK/x
	 Bl3uStjEokxm7bP6mkP17AKJhLN9jBW9g9nhzLF/ne/4q0/yKDAIcqLJvVKjff2k2j3xw
	 oR231pXZCNSkiMOeh85UoLCB2jwG5z6kLQqAWXnQhmJvr/K5euiPbBvPFp+1C2jPe/XvC
	 9nA4Ssl7e5lGeNrIfyfSvlQaLnfzcy/0e9iJzJNoadz3KDMN8HCiG9XR1DKHMJaLc8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAMqf9jJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317EA606A6A1
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 02:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAMqf9jJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC491F000C0;
	Sat, 21 Nov 2026 02:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795228845;
	bh=AspWSZaXoizUJJjls4URc9TgIfvwsUTUVtlg6DcwbFk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=DAMqf9jJpsrGAVx+73amoC25mS6fllRgiYRPAPVDEkmDda43Sg2YW7Vk+Qp0iKHZS
	 jbek8iMy0qpU8xUQcrBkBQFEnt64jb8nE1ok2TND/CSxHelhkXhrsQdx54Iw6h9L3i
	 hH85BE5cUzNvvMmCg4x7V32WztoXpCH0xtz29oCDsO158SP9PaMeGPz+SS/bnfyOM3
	 KAGQZOMbvn6g5iu+cSX5NS+sdufFAt2qoLmgsa6Mxx/xjvcL5b9BS3M84LfAhl1ONh
	 3UzcWbdWnIpbPLB43ckp5GH6IpftrAGhlJ++K/wCWOHNka6U6ROont7dmJOJ3Sy53r
	 h7HMhevy8Aq5Q==
Message-ID: <sashiko-outbox-226550@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 0/3] usb: dwc3: support two connectors sharing one
 HS data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, linux-usb@vger.kernel.org
In-Reply-To: <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052137.32833-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 02:40:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 3-patch series:

- Patch 2: no issues found.
- Patch 1 ("dt-bindings: usb: snps,dwc3: describe two connectors..."): 3
  potential issues (1 Medium, 2 Low)
- Patch 3 ("usb: dwc3: select the shared HS data bus with a mux..."): 1
  potential issue (1 Medium)

Detailed reviews have been sent as separate replies to patches 1 and 3.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121022104.1507=
987-1-xiaqinghuan@mail.ustc.edu.cn
