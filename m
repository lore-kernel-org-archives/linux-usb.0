Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CF23B1BD
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 02:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787019336; cv=none; b=fgs7EzMN4GHVCOBHOX5RPSoxH1Z25HRoS3SV9pqNFHIYotuTllYa3dH5r+SCdAepTEG3wBPAEJb/vFvHYGSDdBzXvVH/vatag6WK7kRryerCZqLs7i/CU0ZQ338yqE2OWx9ZuSCHVJXrUst0O1A3Wvrf+tZds4iaH9fNsUxot7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787019336; c=relaxed/simple;
	bh=mFtjHLsyJJNBrjMe8isAa9EwVdFXUZEP35o7kDfnhGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eceFxWhgB9Z2wSK2IkoOrVdVAMhLjtcU8kUPkrgpep/A83XPUo0u7vJ6ibn3c1Tr5kFP/mBbXyVPtuCDzX7BzwCSvnpxO9nN/Jh8xcWahxkG0F1DH2U+MY61R1ZDgJCpbPWJFpb4tTBCnt/D8yDg4aRLQekX7VJdWdRt/Oj7+f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: afe66f949aaa11f19a56ed5b684f684d-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:27782084-52f4-43b8-ba3b-05ce9816baf0,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:356f9620c72d732a07b91aa9b95d1b1e,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: afe66f949aaa11f19a56ed5b684f684d-20260818
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 159058196; Tue, 18 Aug 2026 10:15:31 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: linux-usb@vger.kernel.org
Cc: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	i@zenithal.me,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] usbip: tools: remove duplicate "daemon" entry in longopts
Date: Tue, 18 Aug 2026 10:15:15 +0800
Message-ID: <20260818021515.1879-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The longopts array in main() contains two identical entries for the
"daemon" option. This is a harmless redundancy since getopt_long()
uses the first match, but it is dead code that can confuse readers.

The duplicate was introduced when the long options list was
reformatted for alignment.

Fixes: 92e11aef70fb ("staging: usbip: fix up alignment in long options list")
Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 tools/usb/usbip/src/usbipd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
index 3e22b651c754..00904508db67 100644
--- a/tools/usb/usbip/src/usbipd.c
+++ b/tools/usb/usbip/src/usbipd.c
@@ -589,7 +589,6 @@ int main(int argc, char *argv[])
 		{ "ipv4",     no_argument,       NULL, '4' },
 		{ "ipv6",     no_argument,       NULL, '6' },
 		{ "daemon",   no_argument,       NULL, 'D' },
-		{ "daemon",   no_argument,       NULL, 'D' },
 		{ "debug",    no_argument,       NULL, 'd' },
 		{ "device",   no_argument,       NULL, 'e' },
 		{ "pid",      optional_argument, NULL, 'P' },
-- 
2.43.0

