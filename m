Received: from mailer241.gate86.rs.smtp.com (mailer241.gate86.rs.smtp.com [74.91.86.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BFA397AEF
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 12:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.91.86.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489793; cv=none; b=Lbo9KK2NBcdBzzSLyYMocBDXzlk3onX26u0HfZWT+K+DRbn4u0cdYhjlRVhw6PIe92IbdJLvsNk+1GN2zN9yG6cP1JBp00E+/QyQDeUxQKYvFAf+xjgrIcnoJSecqJlFK75iMdqwOZQx3Qey6babUjmkS04sQsqHiWgkqU7dbD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489793; c=relaxed/simple;
	bh=qTPbYkiOMspqG6VSxSHXCGcz+MklfLABEK6/0TNXX5s=;
	h=From:Subject:To:Content-Type:Date:Message-Id; b=pCiepXbcbltlP3QOt2xQmCXPw5Dq/SEVeJnwXggEMzWb2dJ/8t0J8Zw4VFVcTmQFFwd7iscmBZv1mLdHaELalDs9CjoMlyt5doNpd3FId5k2nrtgH3oDK67jybN8aQgmCatVmM9XKZTaYyb+dPwipfvHvU1aLFQWd/434J/m3Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=computergamingpc.com; spf=fail smtp.mailfrom=computergamingpc.com; dkim=pass (2048-bit key) header.d=computergamingpc.com header.i=@computergamingpc.com header.b=i1Wo9pxg; dkim=pass (2048-bit key) header.d=smtpmessage.com header.i=@smtpmessage.com header.b=lmS8bKxm; arc=none smtp.client-ip=74.91.86.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computergamingpc.com header.i=@computergamingpc.com header.b="i1Wo9pxg";
	dkim=pass (2048-bit key) header.d=smtpmessage.com header.i=@smtpmessage.com header.b="lmS8bKxm"
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.72] (unknown [10.138.12.189])
	by mtl-mta02-out1 (Halon) with ESMTP
	id 68885df5-f5df-4e2f-9df9-9d493bf91302;
	Wed, 03 Jun 2026 12:09:45 +0000 (UTC)
Received: Received from 10.138.12.155 by Caffeine
 (s0-aws-app2-swarm-manager-1) with SMTP id
 96e7bd73-c8e6-4364-ac63-61e736d14eb2  for linux-usb@vger.kernel.org;
  Wed, 03 Jun 2026 12:09:19 +0000 (UTC)
Feedback-ID: 9194450:SMTPCOM
Received: from ObaTech (unknown [189.124.144.90])
	by s0-aws-app2-mta-in-1 (Halon) with ESMTPSA
	id 96e7bd73-c8e6-4364-ac63-61e736d14eb2;
	Wed, 03 Jun 2026 12:09:19 +0000 (UTC)
From: "Computer Gaming pc" <sales@computergamingpc.com>
Subject: =?UTF-8?B?QXZhaWxhYmxlIEludmVudG9yeSDigJMgSVQgSGFyZHdhcmUg?=
 =?UTF-8?B?JiBDb21wb25lbnRzIChVU0Ep?=
To: <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Reply-To: <sales@computergamingpc.com>
Date: Wed, 3 Jun 2026 13:09:19 +0100
Priority: urgent
X-Priority: 1
Importance: high
Message-Id: <03192026060913CB31C7C73C$AE7FFACE46@computergamingpc.com>
X-SMTPCOM-Sender-ID: 9194450
X-SMTPCOM-Tracking-Number: 96e7bd73-c8e6-4364-ac63-61e736d14eb2
X-SMTPCOM-Message-ID: be75acc2-4a49-4b74-a409-dd2c08e6851e
X-SMTPCOM-Payload: 
 w1FKZ-UxYQvE2C0u_7DVOvbnNewm9X_fVaM2-WtDz9Y9s416y98PKz3C2javoCpneddCI2Zk5LM9qB9q97qQaZ3GOhpjF3B4q-_SbtAReARWCEvlKDPY9wZ_ZCHw7A6fC1gmzycatoxjwg0NdUtPQtcLKrJNa1oJxFqmfsOcQkM3sIZUm2dwl7AsNE_UqaS8
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=computergamingpc.com; i=@computergamingpc.com; q=dns/txt; s=smtpkey;
 t=1780488576; h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=qTPbYkiOMspqG6VSxSHXCGcz+MklfLABEK6/0TNXX5s=;
 b=i1Wo9pxgzeh6eC2NG6bhctNGF/qc83WRcaO/4LQOUo6P87y9Lng+UB8FRZ4iF8Jj8myCV
 wkHR1C/YV0N1zGErt9qt2ZJnSv8c68sbwPd9cnfkQuwuDN+JRt8LsZ2kaZtLy7zA/uuPY62
 io9EX2tThLAhkVvthd6C0m0ougC9r5Y8mKx4IHfLvc19N8LJInutFkksg8Khe4vrb0BWU/E
 ti4b8HPfMbDkUh2MGbp+Q0PmcdxEE12ocgrue6ZTQUN2hOer0bggo3SRxquS9auyEWg2wMu
 Z6bZtHTqnB/ETr/c2a6j2ssWMD8IPUNxwneJtWhInOQZ+USa9fLyMRFL5KVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpmessage.com;
 i=@smtpmessage.com; q=dns/txt; s=smtpcustomer; t=1780488576;
 h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=qTPbYkiOMspqG6VSxSHXCGcz+MklfLABEK6/0TNXX5s=;
 b=lmS8bKxmUXhaMR415zzkGfepDk0yP+kRiqhI6DVzgptOcsMSv9QhpxtJKjDLAPM6kVeZx
 WIC3mAmC5vkCxfpm//Uw5SKDEkypjNtx64YewkotQmj0rFnQ2pU9K2CMKmfKQU24yuBQf9B
 PWKatIoQBYGlviz/o8Fwc619J8CHC76ohWua7XG5xpdg+17RQIQNFBkGMISOuOACEArYmVE
 7/4t+fxSoEKv/DRSUCKsMIYCDCSU+QQQJDg6w7u1Sm0mCIl8Q23p0hbwR0hfQiML8IapaPD
 ztSHyd5pK8gDbjKnvkGCqdTZJsIq7oix2G0PSeMzP9IumpztX11Fufb6LaSA==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Hi,
Quick update — these units are in stock and can ship today:

Memory Modules
* 32GB 2Rx4 PC4-2400T (Qty: 1,500) – $14.00
* 32GB 2Rx4 PC4-3200AA (Qty: 1,500) – $15.00
* 16GB 2Rx8 PC4-3200AA (Qty: 1,500) – $10.00
* 128GB 4DRx4 DDR4 PC4-2933Y REG ECC LRDIMM (Qty: 980) – $70.00
* 32GB Dual Rank x4 DDR4-2933 CAS-21 (Qty: 1,500) – $140.00
* 64GB Dual Rank x4 DDR4-2933 CAS-21 (Qty: 1,200) – $450.00
* 32GB Dual Rank x4 DDR4-3200 CAS-22 (Qty: 1,500) – $150.00
* 64GB Dual Rank x4 DDR4-3200 CAS-22 (Qty: 1,100) – $450.00

Solid State Drives
- SSD SATA 6G 3.84TB SFF (Qty: 450) – $120.00
- SSD SAS 12G 960GB SFF (Qty: 470) – $300.00
- SSD SAS 12G 1.92TB SFF (Qty: 560) – $350.00
- SSD SAS 12G 3.84TB SFF (Qty: 560) – $150.00
- SSD SATA 6G 1.92TB SFF (Qty: 450) – $100.00
* 32GB 2Rx4 PC4-2400T (Qty: 1,500) – $14.00
* 32GB 2Rx4 PC4-3200AA (Qty: 1,500) – $15.00
* 16GB 2Rx8 PC4-3200AA (Qty: 1,500) – $10.00
* 128GB 4DRx4 DDR4 PC4-2933Y REG ECC LRDIMM (Qty: 980) – $70.00

- DDR5 64GB 4800Mhz ECC RDimm 2Rx4 P43331-B21 (Qty: 500) – $550.00
- DDR5 64GB 5600Mhz ECC RDimm 2Rx4 P64707-B21 (Qty: 500) – $550.00
- DDR4 64GB 3200Mhz ECC RDimm 2Rx4 SK Hynix (Qty: 500) – $450.00
- DDR5 64GB 4800Mhz ECC RDimm 2Rx4 Samsung (Qty: 500) – $450.00
- DDR5 64GB 5600Mhz ECC RDimm 2Rx4 SK Hynix (Qty: 500) – $550.00

For quotes, availability, or inspection scheduling, please reach out 
directly:
sales@computergamingpc.com
Call or WhatsApp: +1(774) 559-1248 | +1 (641)232-4364
Thank you for your continued partnership.
Ann Kamila
Computer Gaming PC Trading
2500 US-6, Iowa City, IA 52240, USA
