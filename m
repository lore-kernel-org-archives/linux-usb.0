Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434872;
	b=MRTS7cbxfByGTT/3JT4+F1RY1+8cCANwPgTZtFKsTT+zCnPVPqsW8i9+kj5oZnzY3h5N
	 zrPUHvGq/y1pw3nKp7IfN16xrK6W0gxf3Hc+NhlBpPqmwL0z7JcPEisj2sQCh/heo663R
	 BGSNY53BeM5IdVUZPBiJA/MOrx/GC2TbfbN5CbyxoGm4pDW37tW+GjBPx630OY7xyhhRt
	 UVqUVbTt13xIYxc3rtZoFg00/dSiJeyAl8WGB2SmHwmu1CavOL1y6/pVu7+TR24YgewOg
	 Ux95nPHJdB7S+G3mTC+yIaX1le7IJIEIItsZEdm3PTGEzgfyH4nKqESn66A9x4+VNMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434872;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ori26GoDU5JhjI9CzNWXPqxJr/vAUb/2dM7Q7vdMZtk=;
	b=DsktgdCOvCxD5F0MO8Pem174YGeUFO8g7PJrRjwz+gUfgVdlaPBw0D/vcTqmKExf1dxa
	 Nc2KRPnIxR1nW3b0cAfFghCO7c4VbCgUV63zUs28wtmloLNKyQbrb9f+ezPIvQsTi4XVe
	 k/yjtij2AbPpHfyJFmfOFiR61c0J3wNPup+foTtWFnzXVU6HCiOAM+1VoNL19+jy0eLKL
	 CuArlytVcA1L161vP1PhoONAb0X7c3QvZvNez0zRk5hbHDuTi1lFDXp6Nzq3GHEYgVdJV
	 GJjq1iGJmOP2h00eeCO+4K3GuwVaMk4xV90sgwiaSz4w79AYuPggBDLuuVNs0DbeQlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XTLy7z3v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39233606A32C
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 11:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XTLy7z3v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2F01F000C6;
	Mon, 23 Nov 2026 11:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795434871;
	bh=Ori26GoDU5JhjI9CzNWXPqxJr/vAUb/2dM7Q7vdMZtk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XTLy7z3vHOt8IQggfe4sP+gZdfzPf/9gWHFSBhJETXQh8o2IJtc7XdnAED/XiTPkQ
	 GiXsQA04tR5R+X/yzudcYr50VhC1jd9sOFRskSLqVtluRjUGno4Ge40Clkb6rMNKHb
	 rBTsrEBxVwhTL9EVX4yq3+RJjdWUed6JGPt0d445OBbAKH98/TVWUKygTFdxw0TXj1
	 PDYahPljDmvWYiFKCSTAH3JZhyBCM4+AjPGK5IVwSu45TccKH+wqlQATFhm7JN8f0x
	 DggQ0/iXiisSfJHfGHLLUP0kEzzVMs/PWJltbgbeewXYEbiFIhNvnSDrbP7EJVoWLK
	 ytMPkqh5hEIAA==
Message-ID: <sashiko-outbox-229176@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/8] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chunfeng Yun" <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123113705.2297329-2-chunfeng.yun@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 11:54:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 8-patch series:

- Patches 1-4, 6, and 7: no issues found.
- Patch 5 ("thunderbolt: Add platform NHI driver"): 1 potential issue (1
  Low)
- Patch 8 ("thunderbolt: Drop WARN_ON() in tb_disconnect_pci()"): 1
  potential issue (1 Low)

Detailed reviews have been sent as separate replies to patches 5 and 8.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123113705.2297=
329-2-chunfeng.yun@mediatek.com
