Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6BB48987F;
	Mon, 12 Oct 2026 17:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827203; cv=none; b=K2rAaQnHGrMJky1GWUzeAHUljAJofLDFWPw0vEKCteJrl6ps2rCIHXtwtauMU47B4VoCSxNLRULKbMFfFSQw5uQAiZwedNjX+HcBlUOXjHaPtrDV7LV/DfK9ZgPScSXX00UdH7FUbocNRaco29nzuTSUw4Pvls8tsBwAT4uRf90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827203; c=relaxed/simple;
	bh=krh/0SanbkvGmHxIdaafjLnwq+xCGT74vDv00lpbeT8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FaLVEc+b63USxN4tDLRIWsgsP0Pocf4XhqkNDBHqjBtkIxYRmRjEtbR026CrP+sS2d7/RiJsgIZrRHHGF73r/wtsPCQNpDZn7ifDt99/aXu0exKM36qIJTSnCtsD3yjoVLegxRTlRqeW/WiIIIEvx59rMFGnFCIBCVEAmDPLO8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izuaeTS5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izuaeTS5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADD01F008A1;
	Mon, 12 Oct 2026 17:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791827202;
	bh=krh/0SanbkvGmHxIdaafjLnwq+xCGT74vDv00lpbeT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=izuaeTS5k4LqUwR/f+sIPSyO4mUQlUuYPdWHVyNlcqjp3ZmyjE0AV6519SIHq2l/p
	 CEybEMM5dl9pIs8+bPH2jFdXLx2yMz/yGd/KBgvI49zJ4q6AB6QvV7iuZZbYbNcC6r
	 Vh2I+w6+VO+SVPoG6NwSt9RLjW7ELUfpGtysHQnJwAhs3qDS25I126ToyweGk2pb40
	 6fu2HHcoVGtYiqjq+1EY9Ht4Qo4Nbm0e2RyNstAbWpfdulGH8avv4bWWXdmyPuFjTK
	 oODthfswmW6oRjZntpsgpNLURdovA5CYi4hynp/rilaGFyPJ9Yqc91I+KNoi8tUX61
	 VShp96RTN4vew==
Message-ID: <sashiko-outbox-168488@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/11] dt-bindings: spi: Add NVIDIA LSTP SPI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261012-lstp-usb-adapter-v1-3-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-3-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 17:46:41 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Add the binding for an SPI controller channel of an NVIDIA LSTP USB
> adapter. Peripherals on the bus are child nodes, as for any SPI
> controller. The firmware reports the number of chip selects and the bus
> speed; only chip selects 0 and 1 can be addressed.
>=20
> Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-lstp-usb-a=
dapter-v1-0-aambrozewicz@nvidia.com?part=3D3

