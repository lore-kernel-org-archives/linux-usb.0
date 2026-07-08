Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063423939A6;
	Wed,  8 Jul 2026 11:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508960; cv=none; b=MLoxuaxw7ZAEVjHgt9T243j30tNT5+Ua82Ne0w9mskVkWNA9YW3/MAUZPdDQ9qJ0UuRICJQ167Ecf0DSkbb3ftgnj1UoM5EHd0eINznVmQGdVWKMghvjR9WO/YfEihgZHtFL2VX3Y/mJUb83RhyhavgPvURw5/H/6olepx4SEvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508960; c=relaxed/simple;
	bh=MhHo9XSFsIKLsBWQktlhIERkysg7r9KBiGVCZTezemQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WC26M+3NbahcUXQBumyzoPwkl1bNAE3Q3EI8pp0P8cNMLtt8Yw6UvUToEel0T3zJcygrffaFr8TQpw6yy/FNBh2oI6ov/pemLQTZEqm6H3k+wqbvha6ktJF1UFcorcsuqeCD3YEKI+yjDTeWmXWxHo3E2LMrYOFCb8dE+Lxnmus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=t8kzCSIt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nGGizKph; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="t8kzCSIt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nGGizKph"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7E35E140008C;
	Wed,  8 Jul 2026 07:09:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 08 Jul 2026 07:09:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1783508955; x=1783595355; bh=k4
	xHGSFJhM4nXzWbcLXLhccPhr4UBUQKQQNK0Eb90Co=; b=t8kzCSItFwYxlgy1Rh
	uyXluKS4Wv+zwmIJdafK6FprJn/fnpR939q/6GO126ZfnYsu96RGLwbHW7C+idZJ
	5H3aHhsHcrnaw9Zc4wmgfJFzonIU8WSIQvktTesRh9Sj0KYjpeTsP0ifis0+v2Ed
	QkHCBCQkv3Ll/WaWJZWNc8BrvxnsokK4aa9oP01j/qZHzYJM/6XdK+JjILFTmJPU
	xFfz783jFCBzvoBH969lVNgOU823hftpbOaC0fYzcUXd/k1UF4WMsErWMruYuhGP
	xfI9TLE1g2NFXS3TfBnmqVcwCy294MEa4kl80fuqvHueCbbMpCji/HKaAUPtvj6F
	M7LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1783508955; x=1783595355; bh=k4xHGSFJhM4nXzWbcLXLhccPhr4U
	BUQKQQNK0Eb90Co=; b=nGGizKph1uKEpY2p+rQPvq7WLqnrkTUUQau4ao9hmXtM
	xd/Q35/rxUCpunAz0wHDtmTjeaLbzT4f4U6KvyHLVxQymID56/D2uDQEi80nsbND
	lkgawbV+FfrhcUuNPvENdUDrf7cGgKd3JTOqDLStDbF4NUI4hkWUhU6CUAvsbKuT
	aMtea4E2NEKOS2Jv0fFZmlKH59L7yvXGmeVVXcjcPMruWPS1/OJOUogW63YLijoe
	+GnrlLd1Nv/ShVf9bY0oaxkHnG/likWQBE6aXP5xVVrghL3T2IBlaXJ9azDIBR5d
	Gt0961DGyhX7whepUG25yAyWl7n/lL2IidgummuG+w==
X-ME-Sender: <xms:2y9OarmlrvbI3UaNTH9DQCcua-ss7bxLF57qiFp9zj0jH2rVzhfBpw>
    <xme:2y9OasrT7P4mQZmfayWZvrlE-KNLm5vFba_JR1MNhnCfZY9cp76Sl10TNeZfNH76-
    5VdsH_JpBEszY7aMvs6Umb9nsC4lF6-DbYX52xxc_VjcoxEWA_E>
X-ME-Received: <xmr:2y9OasHelmj0ZryLAmQRJ3gciFk647VehTI-eGtsjYfx65MAcAcBzaDXEI6qMHsBDL0ljbaPurOT0TytVKloQc89lFjtQSXw6A>
X-ME-Proxy-Cause: dmFkZTGRbKh8/gKTkV8kspX35pUtWO9CURH+A+hnUS5U1uCLlOZnIObprhAqWt1eG9f5cL
    BfKDlFte2ti3JJYE+ZuDunu/mkTIIfN2bfgzsq3daG/UKG1gL55pp5FkHNI5KsVPyWmz5t
    cik6wswENaajXguSbO5jUFXBh+Ius6cGmZNqSLr5yucSn0wwstGml0wJPkKiXHsL4uw9I8
    7fFyKi2v+TsV3V3bkGKw90s26vDgxREZ0huDLkz46zHdTRdjbgTZH+vE1w1QvwQfbuLCdH
    3mnAsz+EJyAMSL0yZps3c+gGhpCql3k1B+H7UAdAM+A1Q2sFrUkVtjCTqag6ZV0EUgQbdb
    nqV0AZTlVwkTFNK5qLtldVCTKCetOvKu3Ud0T8f9Bm4eDHyKuZVHULU9RS1gCYB0aWe6Eo
    orrwXKYRCTvaEu7Fpy+k7378geIZvMhW0vQvRwS1g7PIWWU/eGavGUSmYpiytvhypz5Q30
    bIDmo2zkYxaOfliFOmcmHGCVZ6xCLe3FqVGe6+0GfuUPYo4uv3B4wk97dTY7J9yOSELTBA
    PkqmIwILua6SVS0a3erQ5p8gx9xAsXxf7cmTO6TOmxBZQOKKtOakCF7tzd9Atj6tLJvSHW
    FDrdkiktpX4TDSEnxhZf/ZyPFGS+JVDDlMOLVwcE3VN3rTbNjpoQO140lwLQ
X-ME-Proxy: <xmx:2y9OagyM4BrLmh70pigSn1d8MLWo3H8_xVD_iPyOwol5DPXI9qpdSw>
    <xmx:2y9Oapp8aTr4DnLZ7JLxE74TUSql_2Phc3RIzSZlRGwHzWhaYdmdAg>
    <xmx:2y9OaihQASoCtQ7yjdmhQEe8bbzOvdZLgjQp4bHqsdehOvAjIRmFYw>
    <xmx:2y9OauijhUjC9lX3AfAbYqC68XR1wQwraxAg1QM2mYVq3YR657w5Nw>
    <xmx:2y9OaqgGXQ_NbxRyC5p5Qs9zNk7kA0cHreCshaUmYXSIISH8diw-l_eO>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jul 2026 07:09:14 -0400 (EDT)
From: Griffin Kroah-Hartman <griffin@kroah.com>
Subject: [PATCH 0/2] Error checking in rndis
Date: Wed, 08 Jul 2026 13:08:57 +0200
Message-Id: <20260708-usb-gadget-rndis-v1-0-e77e026dcc6a@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMPQ6DMAxA4asgz1gKKX/qVVAHnJhghlDFUFVC3
 J3Qjt/w3gHKSVjhWRyQ+CMqa8yoygLcPMbAKD4brLGt6UyPuxKG0QfeMEUvitQbR/Sguuks5Oy
 deJLvbzm8/tadFnbb/YHzvACCbZTAdAAAAA==
X-Change-ID: 20260708-usb-gadget-rndis-b80cbb3b4572
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783508953; l=633;
 i=griffin@kroah.com; s=20260706; h=from:subject:message-id;
 bh=MhHo9XSFsIKLsBWQktlhIERkysg7r9KBiGVCZTezemQ=;
 b=Plo5pNCGxq/IrZgdROyJDX7+2gecgkxB4gs3joRixXqt2siaiTy5JvYgEAn3LjNFyjRkQ9zKA
 Jya81pHGZqsDT3VRerSigEoeodlqL215PMcggd3acM92rWnhz6tt5c/
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=Hy1TuVHERdQhLAWwjmxLFNtGj7eEEjaZWPXehAlic5M=

Small patch series for two changes in
drivers/usb/gadget/function/rndis.c, both related to error checking.

Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
---
Griffin Kroah-Hartman (2):
      usb: gadget: function: rndis: add length check to response query
      usb: gadget: function: rndis: add length check for header

 drivers/usb/gadget/function/rndis.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260708-usb-gadget-rndis-b80cbb3b4572

Best regards,
--  
Griffin Kroah-Hartman <griffin@kroah.com>

