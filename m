Received: from aib29agb122.bom1.oracleemaildelivery.com (aib29agb122.bom1.oracleemaildelivery.com [192.29.172.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72CD1F5EA
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 04:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.29.172.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775537575; cv=none; b=i/GuoniF9QoRnc05MqCbuzrqesOx0YDpVVt6HCzXv2O/D2HngAggcsKIBC5w4iuVcA7T3FstvuKekKw4xjRqNb9XwNTxbZJa5r7ws/V/uzPABD1IKv8ehFKyOSexKauzQeIXFauzHpflwNnHeChln7JPO3UFEPngWZj670tRM4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775537575; c=relaxed/simple;
	bh=DOGNxOuGnChhZQLwlrQLOpL2pK7O5LofYIVDLE+YYWc=;
	h=From:To:Subject:Date:Message-id:MIME-version:Content-type; b=kQPPquVbkLAg8cpjCB22uks+uXkumpTCcXHZDcN3OJveKPcNS8EaT/ZMSp58X2MqYY78hyl+51F6ZYEt7Kj9sutAQDLzEpzkbXpPiInEr3NEPcA+UWHm6SnPY07VfuW/q4SKFaYWWGyEd43CJguh6ZYNLIi5hUWohaXx6/USDHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linknsell.com; spf=pass smtp.mailfrom=bom1.rp.oracleemaildelivery.com; dkim=pass (2048-bit key) header.d=linknsell.com header.i=@linknsell.com header.b=nThVJr5t; dkim=pass (2048-bit key) header.d=bom1.rp.oracleemaildelivery.com header.i=@bom1.rp.oracleemaildelivery.com header.b=c2ZCKlbt; arc=none smtp.client-ip=192.29.172.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linknsell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bom1.rp.oracleemaildelivery.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linknsell.com header.i=@linknsell.com header.b="nThVJr5t";
	dkim=pass (2048-bit key) header.d=bom1.rp.oracleemaildelivery.com header.i=@bom1.rp.oracleemaildelivery.com header.b="c2ZCKlbt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=smtp.linknsell.com.20250508;
 d=linknsell.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=DOGNxOuGnChhZQLwlrQLOpL2pK7O5LofYIVDLE+YYWc=;
 b=nThVJr5t+rqOwYO18JTAyieOewSM5TjwH46wyHdyHc32aEBFuf3eQy/j7nsEtaCboyY0ByRBn8ha
   ibr/kJLX0wImBwRsGXfSY60h6TdSlKaZFmS+yxxPJR26dyrtT+ETzgt4JekRNcV0eVQT0TAKaaub
   BPYwtRZ8VpZYvqXXRZ/80mbec7qNZr1zqDEKwvB08BHNA9yBtbBSgY9r6W6pQCiCw9sy+uZFMfpA
   Up6NNLkv3PlkrYYzW8rxHSa4nPvhbe77L7y2ekSD5l7O1+d0aRSt4ltYSHZiALD3T/r6jKvj5vEq
   ZVPtZ/kavyc2VUTM4mDWRcIjuBp0hgHu9mpI7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-bom-20200207;
 d=bom1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=DOGNxOuGnChhZQLwlrQLOpL2pK7O5LofYIVDLE+YYWc=;
 b=c2ZCKlbt2Vx4GD/B2blXtI3urvrabQBeVcoozypySMUIHl5quAW3rf2WIu+7HQGz8A8AR+TZXO9L
   wdztoWiUQ8dDZi2TohIrYkWu0ESxVrnceao2VkZhm/Pw4Vd1voV0jYuzAnIA01wIlVlTswm9UlCj
   mdN9VezS6b/eu3UkhVdG+gdaHXKz/svLElSZ2i+3SG4EDALMAm0Zn3dSBlQ/k0iWlgQDFmOJ0vHc
   p4nENdTkEk9l0hSKs8RdS3D3W1EQUeb6A87DzGiw8QE3Uk1DsBILkxYzbFHXd5gI7msaLCMQ6zTf
   jHOWjf2GmBOf2DBoIHDiFOD66tICwW2z4YhKBg==
Received: by omta-ad1-fd1-401-ap-mumbai-1.omtaad1.vcndpbom.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TD300BMPXK3ND20@omta-ad1-fd1-401-ap-mumbai-1.omtaad1.vcndpbom.oraclevcn.com> for
 linux-usb@vger.kernel.org; Tue, 07 Apr 2026 04:52:51 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Reply-to: jisunlee@gmilweb.com
From: Jisun Lee <NoReply@linknsell.com>
To: linux-usb@vger.kernel.org
Subject: I need your help
Date: 7 Apr 2026 05:52:48 +0100
Message-id: <20260407051725.B23C7D173BCEEE9F@linknsell.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-version: 1.0
Content-type: text/plain;	charset="utf-8"
Content-transfer-encoding: quoted-printable
Reporting-Meta:
 AAEj6bHU3iFYhL4RhkAc4XvMjobglhx83/3Wr/nfnnLEUmVBwERrqS6g1FESiD16
 BV/oW88wTFS/FkEF4Op+73dhjPYA3GucINpJdXwIB9TiOCPWkK52AvEvmj9tbO3n
 UPMX5v0h0nqAPXGfM7K8rmjLgpXDm0UmGCPJuHJVKBeFCuPAma709LK1dEYxI6qb
 qozjhc4QxOlt4HtTVR/kqdEbOp7hY+Gwg1S3c1i8zi7H0tTDOLDfVm6t4zW7PJOZ
 HVTvWTmFZbLTQxjjBtoJpTZC+4PZ1ipQP6QsidNc2Gq/tpVo87+5NmYLYOz+oMJy
 o18N6GSdDCEvhzFc18fveESqqGkw1jJtJLM7zPAtIuX+e5zj87t85z/6p0IJJ1ji
 y8c2ojnkek585s0vQj7ZqdJU9BVdOHeFOY58JNHrMQ/RlHQc7kPkBLEAaYIFTmgL
 LrX2x90FD/7hj6mGN/PiPWvUgbamnt2GqtG+yiLeIM2JkruVjlO/uUKz

Dear Beloved

My ex Husband Song Lee refuse to pay our divorce settlement
funds. =E2=80=8BI need your help to recover Assets from the bank for=20
healthcare and child support
=E2=80=8Bpurposes, diagnosed with (bladder cancer).

=E2=80=8BI need your advise and support

=E2=80=8BThank You
Jisun Lee
