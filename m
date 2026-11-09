Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208371;
	b=Xhrlo+vVqAlYklDznqAExuyHQhEgG7Z6vVdSrSXIBUY82bkstVo2yh78cq9frG3Ajodo
	 WpXB1Ie70pyEE1+PgfNA03JJaPjrt9jGIlfK0KlbxOdEsT2Y6tst4FZREHbbIl7yGf0Hh
	 nXURSPoRzThGgAGyapPWdvyYpTdn535JGml9W/MOuHteTvzqP4sY6VY5Xm+5n2kQl8nN3
	 PFcNi+1vdq/NZoX+yI+VNjLPdAuOZv7IBc4J+hofqruKFy1UOAJppYyG0E6MU/b4lAlze
	 y+5uT+FrrbspkdFJCbfaYmEspIUhAn0wG0q+v1jJFOV1B3z4/wwLKX75W98RGTXbxrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208371;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1riSLZfoWaz271t/fvKN3KfaEHPOR5iDelP5GjNFgbc=;
	b=UTpwaInUtaQssqptgdzKnx9DNGc3NNMPM/TdeX2oyXm4LlR5puBb+lqpzHjWjlOwCznj
	 Gf2vG4osIt0zoDEu4OqU55Nwxc5VYgZjJ4iAPvzcmEtRTZp/eXW1FpejOf1gSyxoDFJrK
	 seWN84MEd5uzGUoYVbqer/bDutGfYw2GLL0pOWgHMLg8N4MK3Cv50IzvLsXfyLXp0nv0U
	 dBWFE5GaeQcKE6tarb7eYfYvb28Z2K/rUz76F1ZSK2bHn5sG+FjaIgz4A7MltjTU2ZMPR
	 kwTJSyP0K4tiydbNsJHUnBq5ktUTBz4OhU/1sIW0Q1aoAchDDerBL4NPmv33D+fy0Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UGaVTrvE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DDB606A322
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 07:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UGaVTrvE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2851F0089F;
	Mon,  9 Nov 2026 07:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794208371;
	bh=1riSLZfoWaz271t/fvKN3KfaEHPOR5iDelP5GjNFgbc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UGaVTrvEOxlbhnv1fv24uVnzRUkZ74TM8EybSCBIFTbmFhGXRt/ocIYw0jfinlg1U
	 VzvqWL33DLBMTNc/QHcWByftVNQh5WMTxQV9TMCP7+s/+PUnj3OrVQbwWCPTMfRoru
	 teJKI/JaMwFVi5X4JUE9JHzlxTKDRtqMK1cIND0XrMiFgx/yeFkbiCphvIgCkVCaKP
	 ulCZAsAKya/WZ+BdnaVv3I89vksTIxQkqTnEOVfvzATwjZ3EBFAMAUXwGUFmLBzBN5
	 ACcOnQB/XUO1gy4WAk9/w/hCFUnUs+37QyX6HBmImINKQuvUa6zOsu/V0cTtXKu+tQ
	 dXd1AjUD6iivg==
Message-ID: <sashiko-outbox-204534@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] usb: gadget: gadgetfs: prevent ep0 event counter
 underflow
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109-b4-gadgetfs-ep0-v6-2-b410e3dced89@gmail.com>
References: <20261109-b4-gadgetfs-ep0-v6-0-b410e3dced89@gmail.com>
 <20261109-b4-gadgetfs-ep0-v6-2-b410e3dced89@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 07:12:50 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Jing Lin <kayano050408@gmail.com>
>=20
> ep0_read() snapshots dev->ev_next, drops dev->lock while copy_to_user()
> runs directly from dev->event[], and subtracts the snapshot afterwards.
> A concurrent disconnect, connect, setup, or another reader can reset,
> deduplicate, or consume the queue in that window. This races on
> dev->event[], can drop newly arrived GADGETFS_SETUP events, and wraps
> dev->ev_next if the queue shrinks below the snapshot.
>=20
> Dequeue the events into the local buffer and update dev->ev_next before
> dropping dev->lock for copy_to_user().
>=20
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jing Lin <kayano050408@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-b4-gadgetf=
s-ep0-v6-0-b410e3dced89@gmail.com?part=3D2

