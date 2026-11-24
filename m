Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542799;
	b=xZt1kbMnKW9cAX2SYGbjYYnY60fv7uxq3ZuN5fQvJ0bNs9X3rWBbgFNo7iASEpbM/f2q
	 SfL+XVcXzLrnp7JacLlNepaYHnJluwYj9dqZxGb1tfERSstXBj6p9SxP7Pz36o6Jr9Jus
	 TFgbfzdXG4alVnSk51Tp0jCbtfr7pecM4FIK3Ex0XQU5MBSOtqARtUopXoymxg4xL8Gvc
	 07f3lRqNDZZySZgTk+x3vyLiYBTVUSFlL4nc4wvaP7kQg/W9UF2F/trDDvS3p5kRvovZk
	 ptIs6/wbMSjG9hzeo6pJW823dMIvRIvWw/4V019EpcX5F4wG6F8KHg56y2ia8xGMmpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542799;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Diqn9fR/z6IC/CuA02cHAzdk0ebEy7bKqgH0dPL1qIk=;
	b=eGNzV+CC35GJs7/GpBvVoX7FQkK2OueDXR+nbbmgwljRoQAuUOWSBuGIZhG2iPeE9I3Q
	 G/HN7yZiOlKFNl+qAgCIiLEGFATw/Oehyn62laiCcbYuvI73ZCLyALzJaGt/tzB5HlW9q
	 MELqBbNVnnI+YZIGTFYn3BkRhosCrCwCmwWKQa3rpBvFu7XUDO7eHxWvv2ZBYFSb+hsAI
	 +YWE+ZBn5G7y+Pc2MiUfZbi3QR6ZqxzpNMOdE2nlFehs/K70Z14lxs79JQfehd3bfQeL3
	 yMJeMxxnq01/sz7SYOfU8CMr+/zfKETwrYYP7XZ+zXCq90eT6m6+XJGTEuk1qDuxKCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dEMuMfY2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46EE606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 17:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dEMuMfY2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605DE1F000D0;
	Tue, 24 Nov 2026 17:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542798;
	bh=Diqn9fR/z6IC/CuA02cHAzdk0ebEy7bKqgH0dPL1qIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dEMuMfY2ArSULUd+/T5RNi9/kFycR8PNtL+4KSnHaCEG0Lvl+l1id2H/7jxXafixi
	 iyO7+XcKfjkdAIW6pQWTbv2tZexvd4GuyU4dEwyT+2tB7q5sYtbhU2JxGMMH/urIzg
	 ZyX/hWM/ORO1Kn9pqL0hV2/Yc+M2icC3LecuvApqvcqch/BL6jNjwQdfK36lp7oUfW
	 Fz6Qt3VT2LZ/QqBcid0fRYn2JPfSot0QZtqQfA+lg1QXX5ZSQPLnwA0NCBp1qUNzLC
	 Bm3n9pKv61AfzKAl71SHYfzBL1U86u3MXt8qPKyF9CUPePB4HWz1uT5sNDDA53Rjh4
	 bHfv3M8kMDoDw==
Message-ID: <sashiko-outbox-231755@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 0/2] usb: misc: qcom_eud: add the QCM2290 Embedded
 USB Debugger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Opaniuk" <igor.opaniuk@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261124-qcm2290-eud-v3-0-4f31aef8c1c3@oss.qualcomm.com>
References: <20261124-qcm2290-eud-v3-0-4f31aef8c1c3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:53:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-qcm2290-eu=
d-v3-0-4f31aef8c1c3@oss.qualcomm.com
