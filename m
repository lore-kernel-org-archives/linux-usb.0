Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293089;
	b=q39P8Xn/e8q9Ne1cffqh24EOZcvkY0a+tKCZQexNwf1W4NVq3X0GsLe3J8WI6aH+txRc
	 11UWB0OS90o3CZ3JB2zASmVnJSj4YQaFFn/k4Rz011SX0AHAFQmMdxVUrhrAjOc6lBSWs
	 ppuJtvzP/UwVR5g/P/DK6rNcJQBbf0IgJkdrJ8mo7qcbZTiqkSrtHB1zullZOaR2Br9yB
	 9iu9NGz6W2aW9XJ0leSyv37BNLSizQqa7KRhW95a/CdPMfdaxKsBFw4Fn8xk6H8IRzLDQ
	 hWy74aiWlRUzeM7yYfT4dz1rJjTLmEjGojqWIpfGp/GDLB7aeELggZje9ZQ3ZI1Pisg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293089;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9DARdvMuoc567uUE7ql/jsLPs9qxCaxTQfCxpQy51So=;
	b=OJX+u3IFbMuQAUi7zSQO6qv2nrmO2vV7uPzx1V1hWSLaudvx7hUdIP0koMjCDLn7/xzh
	 dREeSAqP2NSBO3CXnzzl7W68AxKGNzM4gizKRhs5oO2zprsqImNJiLDQtG4wIgOzsY+K7
	 GBqeC8Dvp/wSlxvM8YzPiPLC06JfmV/N1yWb6hLfoEAmtJ9ccFl2MghN6QB0l4dV88QTx
	 Z3LzHamuQX3VZ9Dkto/G5EohhjM4aToLKIXo7fdw793+krwrVrbU3QUmLhOXlMHY172+2
	 7XmoKPfjvu+El13+NSuEKSaeplQCRinbLHYamP5ml7/KhKw0eBfQQtw4tOyJytVx4hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IAA/C06f";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911E7606A32A
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IAA/C06f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FC31F0089F;
	Tue, 10 Nov 2026 06:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293089;
	bh=9DARdvMuoc567uUE7ql/jsLPs9qxCaxTQfCxpQy51So=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IAA/C06fHIWcWWQcHQs7QKLg3RO6ccEwGq6ymedkSosry2L7H5zuC1AIJu4ERHz6L
	 fcRgDQGlHwipgjA/p3uqIoEuVK1xWgqT/mtTfPm7+d9Tqeb46KifKXpTlR4uK8Mayt
	 FQNagkfJ2eXC5p0wLleA8q+HffoJgwTr3OofQ/3kbSe+TnaR9lDMmgLVH+hg20nnCp
	 npERBf1CP6iqHQsbEjH6QSjEZ8eTsjovT+hfrWZFa1NjWXd3OsAbpY0HTIMGqX/zhx
	 7tl/Ybn8g/pbNCTBj8lJnc+H7KsPmixv2q2OU1EQF74nXip3wVVOagbtKqofQvw+rV
	 CLXYgPuvsW9+w==
Message-ID: <sashiko-outbox-206437@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 20/22] usb: storage: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-21-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-21-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:44:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D20

