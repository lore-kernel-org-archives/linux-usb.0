Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=140.205.208.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105324;
	b=uuKTaBhBt7h5z2rHNXEoQpbc++2sWQo5lLuvA7YMhiMdqogKJ/b09wLXQ72x0LqzmVlf
	 Vj2Fq4u8Sg932uN+kliAqkOPW9rCgIcW/sIdNUc9zf+tQzST1piKnufCBAXwjutP67doQ
	 l86MjJIumD1LAuozgIlRqjZ2JbTMMMw3n5e39Sib7cbqxKGDyfdy7M9p4JBN2JRuN4H/I
	 T1YZ2+FINIpuXOafgsYtMoO3nyCqMO5Sy7pI+Zo64Y0gBwQsNP4K7i2Py5cmkl54/UdYx
	 uSm0cM0poAHO7JxK/3cCR4tTU0zzqIwFkHxrtKyTxU3QN591RYy5mut0yJqEQN0zOJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105324;
	h=DMARC-Filter:X-AliDM-RcptTo:Feedback-ID:DKIM-Signature:Received:
	 X-EnvId:Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:
	 From:To:Date:Message-ID:List-Unsubscribe:List-Unsubscribe-Post:
	 Reply-To;
	bh=4kZ4Hbf9Ip8FdqH6Hl2r2Au7c5UfXZBH4niXoxnwLWw=;
	b=c1RRwjT83pBOTW7BdX5NMx4pMZ/WtBmvW0xLB1tFsRippyqi94knPl7X5jYVO3w+j5f1
	 FiyWVIu5Bh9DIj+WJbUjA9A70YBfEy+2gCzq94FqGt5ysJDxulow2XK6bLxM5HWlFstuv
	 Y8UT/2o44en+E8ic9HSTRAKmH6s5Exr33zboijSZs10B8cLAtzy5wq14Z/3Q6Y3m/2XQX
	 ZK6lQ894llSaMgkkywY1Qt/OayJYNqPZEYYO3UbPmFQ9EqS7XKLVKx0UulpIBl0wSkuig
	 MTlvl9ofhyCndZlWPQpKyO1OO3+DR+hGaYgY+Eu4oZbGMcKvMe6Ojj+xzlRZ/W4qicQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=token8341.com;
	spf=pass smtp.mailfrom=token8341.com;
	dkim=pass header.d=token8341.com header.i=@token8341.com header.a=rsa-sha256 header.s=aliyun-cn-hangzhou header.b=cb2J9OBn;
	arc=none smtp.remote-ip=140.205.208.121
Received: from out208-121.dm.aliyun.com (out208-121.dm.aliyun.com [140.205.208.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37823606A8EA
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 16:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37823606A8EA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=token8341.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=token8341.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=token8341.com header.i=@token8341.com header.a=rsa-sha256 header.s=aliyun-cn-hangzhou header.b=cb2J9OBn
X-AliDM-RcptTo: bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==
Feedback-ID: default:billing@token8341.com:vip_edm_SmtpBatch:555662
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=token8341.com; s=aliyun-cn-hangzhou;
	t=1795105309; h=Content-Type:MIME-Version:Subject:From:To:Date:Message-ID:List-Unsubscribe:List-Unsubscribe-Post;
	bh=4kZ4Hbf9Ip8FdqH6Hl2r2Au7c5UfXZBH4niXoxnwLWw=;
	b=cb2J9OBnRA2EwlTMhy0hI/QTepnMVpPVP/iClQrFiJdNKwTUB9814xXcqoAFFS2T82ODffN2YGiYP5LtkRePWeC6wAO08RESkCKyhuGzPK8Kx/OsU3UeRqUQZuDtPf8oMCE6kccvJ9JZeEjNieebEgXM95bVVyyYWZhqBNgYCZw=
Received: from localhost.localdomain(mailfrom:billing@token8341.com fp:SMTPD_-VHcGa9q.87 cluster:AY35D)
          by smtpdm.aliyun.com(127.0.0.1);
          Fri, 20 Nov 2026 00:21:49 +0800
X-EnvId: 600000375182332562
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: =?utf-8?q?token8341_=E2=80=94_an_API_partner_for_your_project?=
From: TokenWorks <billing@token8341.com>
To: linux-usb@vger.kernel.org
Date: Fri, 20 Nov 2026 00:21:49 +0800
Message-ID: <179510530929.2361083.7443331461772838449@token8341.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Reply-To: wuqiong@token8341.com

5L2g5aW977yMCgrmiJHku6zlubPlj7AgdG9rZW44MzQx77yIdG9rZW44MzQxLmNvbe+8ieaPkOS+
myBBSSDlpKfmqKHlnosgQVBJIOiBmuWQiOacjeWKoe+8jArkuIDkuKoga2V5IOiwg+eUqCBEZWVw
U2Vla+OAgUtpbWnjgIHmmbrosLEgR0xN44CB6YCa5LmJ5Y2D6Zeu44CBTWluaU1heCDnrYnmqKHl
novvvIwK5a6M5YWo5YW85a65IE9wZW5BSSBTREvjgIIKCuaDs+i3n+S9oOiBiuiBiuaYr+WQpuac
ieWQiOS9nOWPr+iDveOAguWbnui/meWwgemCruS7tuWwseiDveaJvuWIsOaIkeOAguiwouiwou+8
gQoKLS0tCuWQtOeQvAp0b2tlbjgzNDEKaHR0cHM6Ly93d3cudG9rZW44MzQxLmNvbQoKLS0K5aaC
6L+Z5bCB6YKu5Lu25a+55oKo5rKh5pyJ5biu5Yqp77yM5Zue5aSN5Lu75oSP5YaF5a655Y2z5Y+v
77yM5oiR5Lya5bCG5oKo6L2s6Iez5LiN5omT5omw5ZCN5Y2V77yM5ZCO57ut5LiN5YaN5omT5omw
44CC
