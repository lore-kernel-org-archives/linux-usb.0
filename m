Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794050031;
	b=5HRI2GOjFl7WrOrmsWAfgPtOt5EZn/kjoBwFiKJZYgT7S79JyPc7zMecKlAcbLpstfjZ
	 fVH40KKALIF41QJ269vCS28Y4Zt+cp5fGL9J9Syi/RPCwvYFE6Ls22/7ASK+PH6uYVbwO
	 EDYXbfbP8tBiIUgx1jBuYc3W1iMCGzAamGjkmg9W1siBSKt/iG5ZuEp6av3u14dWwIf9A
	 1VzATe508eXwkFEsy3029NuiMzEIy6ZSh7s12rt8esLmBmA2zxew1gDsO39WpEiaoRNGk
	 H3nPGdAxSmACBQv9afD2q5DcBLpS6U7h0nf7z4otwR7alVenCxchNd4bdY6ONEBDrLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794050031;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:
	 Subject:Content-Type:Content-Transfer-Encoding:MIME-Version:Date:
	 Message-ID:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=ih4Ui2G6eVN8vkL6C1Q+XlF6rqDPoAyHKZX4Vbqn2B8=;
	b=Pj25wPOY7H2s5cz30tBt2Rt68r/mC4uYS3R4diAgXRnTGod1KVHrGRY5rDiCTGXRZ3K3
	 uGBXsP7d30ELL6Lm2Oe3xODYgzU6HQ77IK1cWPIjxV/mTs2n5YD+b5c78lbidMriNzLI3
	 BK/EgHkIQLN/rZMlhM43auSXYnVOEfEmKDHv34ReL5ooWL9zncArXmeFbTZevdrK4KGd0
	 ipPwOVFuAdx2cwTs+2XoVCJsmCSTKoulre0PZNhAYf3Ea4/ghD19AvP3y7VuyRTZCJHgs
	 GvRxnLpTv4rYgmZwsVw0GY2QguDN/8m7btcAo7VOfqNiovMXQET0ISoV/Al4bRvmeXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.com;
	spf=pass smtp.mailfrom=gmx.com;
	dkim=pass header.d=gmx.com header.i=thomas.thomas5341@gmx.com header.a=rsa-sha256 header.s=s31663417 header.b=TMtrkZ4b;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC2C606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 11:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC2C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.com header.i=thomas.thomas5341@gmx.com header.a=rsa-sha256 header.s=s31663417 header.b=TMtrkZ4b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1794050028; x=1794654828;
	i=thomas.thomas5341@gmx.com;
	bh=ih4Ui2G6eVN8vkL6C1Q+XlF6rqDPoAyHKZX4Vbqn2B8=;
	h=X-UI-Sender-Class:From:To:Subject:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Date:Message-ID:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TMtrkZ4bNaC8ARKJBtBB3rzN1RKxPPRYDkuF3QI94mt61M8qA1mrUYZ8DlGJbddZ
	 V/4xGjcJqxFlrafFNFrlACj2Bysn3Z1jJxcqBMXovLg4owiodh2ac+nqhMNrW9aJw
	 UlPl8P/x/CLAruWvbB4gC4JvBf0LlTfNmkPRLLDANwuq+5JsKVnGp9Gi3R6UcUlYS
	 Is1bKckysPWXzGO2i+XkjN9/sD5s/uB7B0bBeXlb+VAej7GUnRE9E3TQwIu9AgacF
	 dD2QkC8obUlUfRZhrxAk4MOFawpImLBWLGMqqwoUagIJVE0qhLTM4iqh9R3JUfazP
	 b++AK3b0YAO8RqAMJw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MPokD-1xBhzL0vUh-00U7U2 for
 <linux-usb@vger.kernel.org>; Sat, 07 Nov 2026 12:13:48 +0100
From: thomas.thomas5341@gmx.com
To: linux-usb@vger.kernel.org
Subject: 59919780212955573582
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 12:13:48 +0100
Message-ID: <1MRTRH-1xB9kv1qlh-00TZmm@mail.gmx.net>
X-Provags-ID: V03:K1:JmVbGTBFl7Tr9V5XX67avGWCcZGaEe8XXhDlyyWiOZ00BDBxa46
 OQuw8TGWg/3EcV82lJ5ESN+ZwsFbmZzR3dpUkUwU12qDLk/X4fMtoD749glAMCrQQ2xkr6a
 dQbtmruLZbQXbZp4c4eAoC4TQ00bn+IHss4ekCRU9OJCYgbWhYcUSMwYucSL8xTjWa0pOv4
 81fYeCbd3ow1wqX7bhN/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HAbdk7rYwuA=;H0Ghhel9CJ/peE0kTjO8kITmhc1
 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
 bLfQdqWUqQZkRLKMpKQnQU

897936922034981----real*news
http://45.32.111.135
047166409352314
2026/11/2~2026/11/9
----hkoxghsyleyqyvnk
45.---daocrzxhjso
77.---ehdytnrsxqwbwmknjirh
40.---ajqutcvhzl
60---hbxcxsawontu
sovabzlktquqlno
