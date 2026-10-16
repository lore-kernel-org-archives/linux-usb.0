Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1215C3BB9E1
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138426; cv=none; b=b/JmX4/I0JbsBPbuu9hCHH4MgCWt6vSacC3bYXfHs+AEgCfMBpV//1jzFkJ+iVUoQt4PYSTWGr5TD0IItf2awpEnK4bGtcadCb/sZoMERkKwsSaK/PsBHi21C46JjRn4jmrUD5iQVOywnk4xsUqcSrl8aTpeWOhd/0hNg22SaHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138426; c=relaxed/simple;
	bh=kO0skQvzyl2XB390VgpeH64YTkkWEYxq+Y1tmLj9DgI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KU0e3TdI5ZEzXVgPI55IjxtAFd95lZIARefduNF1cpddy5LTnG4BJ4axKDRV/xUT6A/qcGumkRBww1YCdm+Ns86IilAzJoAX1F1PYx+6q+dWIg98tBVNKVhUCPqYNFVxf0HDfD0W06WfZKE0AWszKYeZBYzZkdWYD30tO/LBhZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMNRenCd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMNRenCd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6483B1F000C4;
	Fri, 16 Oct 2026 08:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792138424;
	bh=kO0skQvzyl2XB390VgpeH64YTkkWEYxq+Y1tmLj9DgI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QMNRenCdyx8B1WYM6JMwJnxvrc5lCa6KGpYRWoJQiqtQfpszdfmxIHhbHNfxqjUoN
	 GOGzsrp7HF9MOt0UHene7mToMA2CDd7UVz58/ULKGOz0+y+Ngm2s5BiI3yAIEbMVf/
	 oCXrykPMqBeoEqRda9vY0QANRNT/+advVtdFK0cOD+GJhXgYhMYU3D8e1W0NjFVE9g
	 bUYKbWi6vifWmB2wXEvKiwMGdt/Kkfa6uI89FqEgB5E4VpYU1zDmgQ8cp/MRkUbwLS
	 kxxvfeEG4oGD9G5Q9st8ScPQXSs/zuVLogRnwLHGqRDnEuhXP1FAr7Xe52cEKSyc+d
	 ZlYLvzJupCsWw==
Message-ID: <sashiko-outbox-174003@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: nb7vpq904m: Set client data in probe to
 avoid crash on remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chaz Bailey" <charles.s.bailey@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016080517.156248-1-charles.s.bailey@gmail.com>
References: <20261016080517.156248-1-charles.s.bailey@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 08:13:43 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> nb7vpq904m_probe() allocates struct nb7vpq904m but neglects to call
> i2c_set_clientdata(client, nb7).
>=20
> In nb7vpq904m_remove(), i2c_get_clientdata(client) returns NULL, leading
> to a NULL pointer dereference when accessing nb7->retimer or nb7->sw.
>=20
> Set client data upon successful allocation in probe.
>=20
> Fixes: 88d8f3ac9c67 ("usb: typec: add support for the nb7vpq904m Type-C L=
inear Redriver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chaz Bailey <charles.s.bailey@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016080517.1562=
48-1-charles.s.bailey@gmail.com?part=3D1

