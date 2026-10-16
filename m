Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B0B422E2E
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145627; cv=none; b=kK+LXLQIDxP512R2nRSAx/jcCypheYa25r8Zx/209KAyYiEsLKVyzwg2hgQKCxyyOIjT5PJT+dInkV3n3fcqe7dSbvPGWEibDt9to66prCL7V1M+S68SG4VhVtoQqTPHnpOM+oas9vhp1cOqzVUfo58vnuCb18JNKuVW0/iSXL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145627; c=relaxed/simple;
	bh=+EOWofbXM625BVIwpFSuhVq/pwEBhe9E3cP6JC2PnbA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nsHf5CFN7++dUfwSort/t8+R5zf/FYAuAVaQatBHv0DRDbZpIlNpOkcvltbbHwsJ+KdaOE/OiM0woI+UvIK9ueux6x1mR2EaRu6EfZ3cjL4po/sd0lWXe0k9HDdATQBKypOGK6WmYZZQ7ECuXrdYiaSg4+N7usgaikdybZox9sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzWHI5L+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzWHI5L+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A1A1F000C4;
	Fri, 16 Oct 2026 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792145626;
	bh=+EOWofbXM625BVIwpFSuhVq/pwEBhe9E3cP6JC2PnbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kzWHI5L+ns2ubVK27eoYxyMp2xIZo47RiRcmSw/nKgB8zrtUo2eGSkzZBgz1Zhx5B
	 O0zBgN8u8lQlLk2CWBbljsTppRsmFTAt9rt9RjN2VMXVGY4foRdyWScvw4L9vMuy48
	 Sx/nJfagAEDVUOBJn25z/vxS4AB98DL3826RXiaDuIBIdvVPCo6zTU5FATyRjo1AIz
	 NUa12BhVdNCCdzIujMQcln6ciM5WaifX7WYjpevz8anvEpj9niIlbY2m3we+U30/GW
	 YDRmhctnSncEBeSd+8tIfXFuiRkfM+GIDDmK+Z4ax6Yu4uW/I5ScW4tPxrBzFRB0w6
	 QZnFC5OjOkieg==
Message-ID: <sashiko-outbox-174133@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] USB: serial: mxuport: handle output flow control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Crescent Hsieh" <crescentcy.hsieh@moxa.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016100351.681390-5-crescentcy.hsieh@moxa.com>
References: <20261016100351.681390-1-crescentcy.hsieh@moxa.com>
 <20261016100351.681390-5-crescentcy.hsieh@moxa.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:13:45 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Use the USB serial stop and start callbacks to prevent mxuport from
> submitting buffered data while tty output is stopped.
>=20
> Record the stopped state in each port's hold_reason and prevent further
> URB submissions while it is set. Keep this state separate from the
> SEND_NEXT hold so that transmission resumes only after both conditions
> have been cleared.
>=20
> Clear the tty stop state when opening a port so that a previous close
> does not leave the port stopped. This only stops new submissions; URBs
> already in flight complete normally.
>=20
> Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016100351.6813=
90-1-crescentcy.hsieh@moxa.com?part=3D4

