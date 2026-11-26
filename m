Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686754;
	b=G0tS6qb0XLGxSx0gwm+I8uJOcvipVkxjNcf/Lk2v4dNkfpU0OXW8/vMJpVxLMId77xiO
	 3OFe/1V41YcZTstlBFH2YbBBlZlaE19FPIXh855Xuf0rkpYRjROYbDSeHNGBo3pzyU/fR
	 7k6YbLSpobvmCen/PL626vmAEn4WxK9NHwLuEv3wyUYWlJRJOIg5/UPM6NQ+NsLuZsRb8
	 V7sFtS4uJO/1NWzHeWkGOTrreMfzMfXmFZhWfWvppH0Aa7u61sifcLBLbzfjGMXmLSN/w
	 vQ9fGqIrzyqLOCc9xEBS5IKW+C+cv2SQP6eBS5xEKoKMn7QCKkLb4DmX1x31ePqxO0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686754;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=e44SngY1glCM7flXYEFE7nTd2RpR2NncsXtLn9sih88=;
	b=c/QNIxGQYdIFAN1GLzjVxmYsO8Rpnnil7vS2w2ld8qPo9kJ3vw0ODpERmNQvHeJVbtBn
	 9bG529MxSID/VvksW4cOwocZeMbiGPiDUKvbYQruD/jKiZ57DU2JQ9BF8/ZNrzc2NjkI0
	 r9Ru1PKJTqZSwkfZOV33IdQRdGAF0W20ek3aaUSk495OjjX5aKmCcW5J0JJmXyvKgSQlK
	 Ls50qx/qxPRpNBWqV0urJlo1/qyeH9eKFP4d01/AFYKNheTDFoJ4PggOA+Q3dehjf/90F
	 AzX/IDFzTcqL2xIy+NtgI4waxJzENyZBJyzflEt4lzg4i/KcrofsX0P9W29NjNJgI1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MN3HMLYs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95794606A321
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MN3HMLYs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27A21F000C6;
	Thu, 26 Nov 2026 09:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686753;
	bh=e44SngY1glCM7flXYEFE7nTd2RpR2NncsXtLn9sih88=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MN3HMLYsoYtMKi+DClvs9qkAKh/81jK7lTpzsAJGP44Df4O2q7Ygg0TNta428PpJT
	 ojLtu3Z/+2Q/HSauLjZAHFBmu8UbIcMcrJ15ZI6EwHUOEg5zkJU5VhFWstd6zTfD4C
	 0EhwkbN1JWqAa642c/NxJKrPPmnGx6QxSN5Ll0cwvxZMcfgizKDJaudN1a2d6m1L+a
	 Hl5oWtPt7eZXkLI5hWUV+jqS3hclme8D/veM7/kgscVGwSxHcI0shFdvAVumB9tvgU
	 wm/OXEaFVRRYv2dypqcvaLQs0Nh4grEJUVnzFUC2letaUBVyO4nvGIO513ympBjN+R
	 TPrICYEmWCuuw==
Message-ID: <sashiko-outbox-235189@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/2] usb: typec: mux: tusb1046: Support no-hpd
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajit Singh" <blfizzyy@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126093819.76480-1-blfizzyy@gmail.com>
References: <20261126093819.76480-1-blfizzyy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 09:52:33 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126093819.7648=
0-1-blfizzyy@gmail.com
