Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528054;
	b=d6MIiezpx87ecaF8C1eRY6zvoV1HNoGFIBu37Wx7kpPcaXGsrhFW/aSF5xCp0H3ZM4tH
	 zxz5mYu64+ww2Ws84hc+5v67pc+ZiKr0eepdjD5HhW1I7PcmM+ukpw60fJmOWV06FZ37M
	 0imnvD53B1op+q+qBeAu8JAlI8fH/wsLuzDZ51yOiHD2PXF4oqmhZzJwHskh5e7kUsVgW
	 aM8ME+XVthrf6c58rk+j5zqZ5xw74nJDuHV1OAEVQCF95A4JTzg63t7Z8OmTc96r6AARt
	 7yoa97ucOIoVoAhLjZeFqORO4muovfRcGJbWoTPXlftFPZkYRZYXQO86gyNZgb0aecA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528054;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IYplRZxrO2d2zFE0YGZjUJ8X77r36SA8U7FqMjnst9o=;
	b=qTaSYtToRwer/X80n3d38t9mX7BmhBxzZDYAuu4w6I1jz9uJsoWaH4TG+EjAwFIY2Wtl
	 vU8Vyd/xYsdWYsvVTZkvjcwG9Tu7cvFObks6X1+eOrtT4ClhFK6dt5uNlq51B1QAwEkq6
	 PEz91KRT+e9j8NjYJg6Q/yVAyhkWy1cZlS7ELIFEolW5nms2tBaUu0zCaExCjlCM0Mu9K
	 53x12egDwCIBqpvG4Yc+c94PA8bo55rqMgxNst3tLSr1dYLO7kZitHb5OzunfuJKsgdwE
	 Otz9Vxm46//YexbXHSa6q8JCQOM8YSnd5k49ZzGIIw2VOmaWnPKS8IIamOTKXEy5GIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M0hGplG0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF454606A32A
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 13:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M0hGplG0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A981F000CA;
	Tue, 24 Nov 2026 13:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795528053;
	bh=IYplRZxrO2d2zFE0YGZjUJ8X77r36SA8U7FqMjnst9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M0hGplG0pkLc3XOZwPoGeDkb57Rbf02FAH+zjDnRhahrGsfxbGPiMgh6UfRqWyLv1
	 O8OeO+lRoFagkjCqrmTu/mzSp9G0lrIp0c7SgYgEuooqRy7WqvaxsArsTD+ubdk6M6
	 /ghUdR+2fkpVqWStQelfCjhcktsKRXe3/kVWjQraGvTfaCp+NJ2S2sYr+iDbBT25bi
	 5FkIMD53lg1kbPsicpKLbAbtScSC4WnJFYJ6p40bp6y8wuuCrBJdTrNOoTwf3HXm/N
	 +rpoMnJchcElPlfNQp17UifijvCKob9gb5Qd3UVxQPobOSdOrxKvUWwBxAhepf9eyS
	 XTq2zgBR+tTJw==
Message-ID: <sashiko-outbox-231252@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 0/6] Axiado AX3000 and AX3005 USB Device Controller
 (UDC)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261124-axiado-ax3000-usb-device-controller-v6-0-b991f9b27111@axiado.com>
References: <20261124-axiado-ax3000-usb-device-controller-v6-0-b991f9b27111@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 13:47:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 6-patch series:

- Patches 2-4: no issues found.
- Patch 1 ("dt-bindings: usb: gadget: udc: add Axiado AX3000 and..."): 1
  potential issue (1 Low)
- Patch 5 ("usb: gadget: udc: crg: Add gadget and endpoint opera..."): 3
  potential issues (1 High, 2 Medium)
- Patch 6 ("usb: gadget: udc: crg: Add core driver and build int..."): 1
  potential issue (1 Medium)

Detailed reviews have been sent as separate replies to patches 1, 5, and
6.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-axiado-ax3=
000-usb-device-controller-v6-0-b991f9b27111@axiado.com
