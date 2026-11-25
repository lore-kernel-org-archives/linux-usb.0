Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596378;
	b=phkGH8FK8c0hf80M5DCsRdIPf6UuM7kIfHa11RvtN40Yek6aTbpMDFLAVYswUBRC83DP
	 taesVaoNx9TxsLOamsWd9w7ztiUM6aaoLx73MbWWQzVHweQP4jquD4YMhnK6fdmO5ykxS
	 5HouhWwcw+Ws3YptS4pR3U+7P+NO3lUzGAkxwEizYxgVmcs2aTIxzhhkpvnsCJihuslmi
	 kesEGFwJFzMtZg3Uf/2GCr+wrfd+SAe99vmj9ork5HOAYYsPdj0j29UPDCleFuU+rvqaZ
	 oGvf/Lfh0QyrPm4g2l0WIDVPdUJHMJRbjRMk+y6kq+zbnCBbat3e1dUDMiqiBvZ32hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596378;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j4ErVmcNY8uB7X+Hbq7+VEtp0r3o6nWa+ER5Ys7HjrM=;
	b=5m19t6eyznmZBzGadLIZPQ/knYy3oZGvwPuFm3K3EapbhdOEiwmI9NkiVVluLGNNzaVJ
	 HGl5L9Q02cIfYLU0HROEmAXks8o1idZav+mn0/kSje0Q94Js7FvzU2kb61sglNI36k4mD
	 /ZJcOoMFp7yrkA8mEURQeTAzEpMuqmcyEaF7bfpRQx3i6hJgU0czRKph55czWyo7RgtJ+
	 asKk+f4gDA4XhDgd3NniLnH4cP6HrJExe6a+Iraic1308E0OYOPKpUSFc+14cIPs6JOKr
	 mr+n5yVvEGFlubZiX1MXzBhjR9u6Bh9awfpvQguHLm/Uc90oZ7TW++QWLV2+sX99JHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j7FnCaAo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620C4606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 08:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j7FnCaAo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA451F000C6;
	Wed, 25 Nov 2026 08:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795596377;
	bh=j4ErVmcNY8uB7X+Hbq7+VEtp0r3o6nWa+ER5Ys7HjrM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=j7FnCaAoFoTDALc496GPxACjhKkfsL/60Q2NFMqisGAjPRqAkSw2/KGMElIKWBMgI
	 0mx5RIqO/dncs/q2I2BJGtbLEuaDfRtiYmVgDZc2Fmyrp7YpIphyy70a80kvjeVTny
	 QerNrM6jdOVSDsoRbl9mbnLzlC70VYhTA13BGBxU3vbnp8OOKZv4mjTH+g8mGqsMX1
	 Q7zSl2rjNS+39CIYyoRm0ecW8NPgNciytQdk5L2dztwj9ny59U62n1Y0NuZBj33oqm
	 9EjMIoRAMzXmCcJO8Evp53G9+Yob6BS3eZRRssSLX047ozQR5NnwZ2bagJtuQ1j6wG
	 25RJylarsjUmg==
Message-ID: <sashiko-outbox-232937@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 0/3] Add StarFive JHB100 host field USB device
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Minda Chen" <minda.chen@starfivetech.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261125083736.50606-1-minda.chen@starfivetech.com>
References: <20261125083736.50606-1-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 08:46:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125083736.5060=
6-1-minda.chen@starfivetech.com
