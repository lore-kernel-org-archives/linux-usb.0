Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794A51B983F
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559342; cv=none; b=CwXVGwJ0crNb8KWW5pyYlYTfnqKxne2M9dXiTz47mdh2Z+fa8io7dM5+912Ihbl7MfveqPL7A/hJoNPejBnuAvgAzfXAsSLxzdLYWNGo7lM2FAO5h7q0iZW0JHqfPZxnKdEVv7JTBtA7TdMDoJbCAPSKWUwhpAhxY223pWxvJdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559342; c=relaxed/simple;
	bh=YrR5L1ESnGREdSDDwkbmk8KKe5zOd7tedKntxcwq6fo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tjp712c4eelVPTZ9LWiAPw08VErqaIGuWmlx1A18ENyPt9k50lgg6JNmf09ZPQEZVLN1AUCrLExuaeYVq3aJNQ6RZqnuyBtXumYD7VWE91Iz917E831RpDweyaICjcCfZwNrCyMcUNgQb8lGr6uiYR22BbfarupcSOfc0dyBfi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iiCsiuRP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iiCsiuRP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057101F000FF;
	Fri,  9 Oct 2026 15:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559341;
	bh=YrR5L1ESnGREdSDDwkbmk8KKe5zOd7tedKntxcwq6fo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iiCsiuRPzFzywU0/y35ojF1IFWc+ZkI+R18jnaHYxJLlmUWLrUn1k2gbETHey+7Zw
	 W5tQBqcjvvZRJkHaZUmHywZKieXBviWbVO0gUk5AKettN+Oal9LAD5W24aIvf666+o
	 mXH//RoQlYtCtfvtjKI145nZ9BUT23ERxgkbZDqIZkeb5zdMsC4C5EknZLnmsaoyTr
	 zpFwrW7/KBuOgVsz/GqwQIKY22JCu/NAN0tRqrywhoG0X2vTqWL+8QGuM2+RLxKa5a
	 GOSZ4hOECz6AYeCvZ1l2oNeakYzW4tLz04YEzDiDyitTEGIEzaLPxdcj5Yog+ceCIm
	 7kouaPyx1fO3w==
Message-ID: <sashiko-outbox-165761@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/11] usb: xhci: Shorten the TD skipping loop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009151624.618967-9-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
 <20261009151624.618967-9-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:22:20 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Michal Pecio <michal.pecio@gmail.com>
>=20
> Half of this loop is code which only executes once to deal with cases
> where no TD matches the event and then it returns. This code needs not
> to be in any kind of loop, so get it out.
>=20
> Optimize conditionals remaining in the loop body.
>=20
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009151624.6189=
67-1-mathias.nyman@linux.intel.com?part=3D8

