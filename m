Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201E83F54DF;
	Wed,  3 Jun 2026 06:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780467998; cv=none; b=frafJxjkFd+xvNvnEa2u9EHhxMk+2IDDyk2KQhA4x1RLmBfkrL6yI7boehSZ7L910GtiNu0nClTQzqRFQpArTkU7ccFdA7u27bg49tKchqnTIVg38Q9/PvYIEb0FEpIrIT6rmC25so+2xtjogg/rp1fwvhCr00n7GYZgM7FBlRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780467998; c=relaxed/simple;
	bh=uOIpSSc8b36xaSoY2ngJEpGOpJsetToDYXDjTAtE1fA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GPM7FJ02id/Y+T+BU8qNwfgjzonGbuk4Crds2xsld0BIktdesXtU0fw0nIl8XJZX0x/V3/f+8cVxh0NnZD2I3bA0ceghakK0fKSUhmR3vroMm+TUFEajwoJso2QGJ48kRghIAInfqOiVdHNaKQ5uHPnSRNuJZWyA0ujat+ufjPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=WzKi+E0o; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="WzKi+E0o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780467944;
	bh=ebyoMTlPwiuTqytkHNBSCWGwbd7KHLsifEoVS9wk7Pk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WzKi+E0oNH9QuAE5NN1uix+4k8D6TEpBZ8M0rm8v3uLaKpFep9gHumAt1KIrEWzEi
	 DuU4CkLiYI2W+jsrWi8mg6wqlYfieG3Vsk4DDGk/mKBtySIUAMNswU4c7ALS1/sy9C
	 5pct8eIh1uk5uZiPpMHD0cwqr2mRa8jrjAHtAka8=
X-QQ-mid: zesmtpgz6t1780467939tc3dbb76d
X-QQ-Originating-IP: 0BplI3d2Iw2wPEiNHtUqVRljn4G593hAtdmUKb9R1NI=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 03 Jun 2026 14:25:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15624957994155008164
EX-QQ-RecipientCnt: 10
From: raoxu <raoxu@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	mathias.nyman@linux.intel.com,
	katieeliu@tencent.com,
	johannes.bruederl@gmail.com,
	raoxu@uniontech.com,
	kees@kernel.org,
	dengjie03@kylinos.cn,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: core: config: fix SS companion log for interrupt endpoints
Date: Wed,  3 Jun 2026 14:25:35 +0800
Message-ID: <85BCDBC1F65453B0+20260603062536.517734-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: ObMUpol0MB3oJ0qr4l/GCIcVdLbDy7go3QYv+zqSdrXieELNgp2Df3Kv
	4EDMdXydKQ/dC8yyzRv1JCbvJK/znBtLQpeIXOnIOZ75KUMXqfjP+gBqM2NYoSHxs3+l46c
	BvjJdYID0RI7aAoANMBj1ETJCtpJgMYJ0pNxsx1AQLuNbMoP1JVv6PzO7GJxy69hgM0np4w
	2ZHZLmRzfZ6yYGlbCkWF0TeAkOSuqSGb3srw8hOH8NaAyO9lMjM9LJG9H5gI9vHQ5B3RO8h
	UyJiQyei8nqePnW6H2OCRBZgxBKywlG9nJR+on0rc9ooSiVqeZCp+4nuxhUy3H3VPiEdOFn
	s1V6mR+zl92XHpLChlBc0Xla0g8cou25tEhum7d0Pi+r+VHlYjOH+IjaFfCg8R67Nyg4Oj1
	Zjs0P7Kq071zCGZ8kahikS54+pOvlCXVDjYZh1MQV4tMd65xOHJmLvLuGwiBBWy7dxBJlR4
	cOKg07/0YVStA/TNtuOY12PLo0Q7A+NQy93Ensvlzv9shCzFJk4McRdFjNDP62n4O5Iramr
	8Cz5C89Lhpe/McKgEnQXE8wrEHaKghUthXCUHuolEDvGDkppi7VtdVnMvpuclT/Tj38mtXX
	2jfD4mKxfGj1GKjh9F2R5vrfXerZ0++utMHDF//bUvHZALMNltkIsZANfTGOByFryWeoH5W
	KxzVgJ+ngCPBiWWqLB1o19Ab42mEFWS6bgsI5Ib1SmRIBoMykLhpfo236Dm0sJzxesiCSNc
	KRhCJ5Ho5Z2KxBl8QUmWoIK1gs71dQx3btVkNNmtzmFWJQZFYuzxFOfWlbJ/mx5TRefmL40
	1Yg6LwkGQMiHeyRLWPYJmnbgZ9UQ7zOXr8vvQK7FxHIOyTsww9hbnV26vqwvD6hrKVcor6V
	gwDBY+xcNdlFq3CQZC5d26y6/9aUYx/JZnzuxK1fZ50STq/HD4ls5y/E51uSHPXPuzpp6KT
	I8RvoIzpj1eOLE2stXi8M4Skv0vIYzQY+ISSFvW2H0hboj3CkY44QwYuvSHgPHdafPxIknn
	bucFkBzyRzDX9+Cz0kZjEEkIdCutUf6ZVB2UuxavLt3Mp7GqWE
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

usb_parse_ss_endpoint_companion() clears bmAttributes when it is
non-zero for control or interrupt endpoints.

The diagnostic message reports Control for control endpoints and Bulk
for the other branch. However, the other branch can only be an
interrupt endpoint because bulk endpoints are handled by the following
else-if branch.

Report the endpoint type as Interrupt instead of Bulk to avoid
misleading descriptor diagnostics.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/core/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 417140b012bb..7ab27c371e0e 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -160,7 +160,7 @@ static void usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
 		dev_notice(ddev, "%s endpoint with bmAttributes = %d in "
 				"config %d interface %d altsetting %d ep %d: "
 				"setting to zero\n",
-				usb_endpoint_xfer_control(&ep->desc) ? "Control" : "Bulk",
+				usb_endpoint_xfer_control(&ep->desc) ? "Control" : "Interrupt",
 				desc->bmAttributes,
 				cfgno, inum, asnum, ep->desc.bEndpointAddress);
 		ep->ss_ep_comp.bmAttributes = 0;
--
2.50.1

