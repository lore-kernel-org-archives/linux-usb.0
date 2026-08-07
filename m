Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6661A3BB10C;
	Fri,  7 Aug 2026 08:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786090745; cv=none; b=EchyP4uU14zbJ/ufzaGXgPGqJXqKwsgcqkm7fnmliUdwrtzUmak5FO5sVt4o3cYlEm9E3qPvsbQ49gVvnsM/rrBg2/rQpksgdOEWc81eGUMZT7vurbEojxmk6MCu5Q781+zPItSnXTz9+ZKgE5xoR4YvJKF9nn2jEBIZzqy96CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786090745; c=relaxed/simple;
	bh=3noGQ+KpF2p3Y9bXPGyCvEV7Rrv82TXVKu97HKiAScU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WpRlrnU9yGjlvhlN45eu/s8uJylARJjujx8gSI5yglGCcq7Ocez/vt5KXgox10DTQBzsYJiXlKi1BZiqlxhgj6Tw02x6fyyrrWSGd+l+DiSp8YE3IPZvGJEfA1bwRccujFF3t9hyfe8Yuki0TW+ufWBe8DGDUzhrUIV0rbMyJXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=S2aMY40L; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="S2aMY40L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1786090715;
	bh=CxP1p0pxe9YqykBk0/ihr6VKlauEGCugYl8usdN0hD4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=S2aMY40L5q6PArn47hr+slH3ULayxDdVZBzp2ywQDrEu/Do/fNZX3VpSWvJlCJBHK
	 nu6ST/NfFeNo3JaAo8gv3kFSuYFAHBeI/Gcvk6CpmAvF2TR5qniQOsBcT92tLhooLG
	 ST4c1oxu4xqlUjFL8fVwxD1/qugtLqZcDzhqk9l0=
X-QQ-mid: zesmtpsz9t1786090710tb3eb652e
X-QQ-Originating-IP: a8w8wAyJnFhsS6U538U5mblqPy4M+DOPn8py4bVmkXg=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Aug 2026 16:18:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15937565214365167119
EX-QQ-RecipientCnt: 5
From: raoxu <raoxu@uniontech.com>
To: heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] usb: typec: hd3ss3220: fix VBUS regulator error message
Date: Fri,  7 Aug 2026 16:14:22 +0800
Message-ID: <860D4D55E131FB70+20260807081422.626412-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OKKvvo6f47/bUxjiYlwTFKNxlYS2rO+OG0UScA0Cawo9quD/PIoDdUIh
	mhKoHPHLV6RfKCpcLY6MVuQjh6lWtnsXlHZ3Kl9pK15pEv4bIAdJyoXTUDo8ZNi3zE99Ifm
	kogGogvdQ7+490Lo1KLqkoN185+YGdV5Gd2qpWLp926hI8YGRFVKhsWY5zo+GWBVMDk356W
	pk02Y79N74pcgKpqxLEXg2ecOqk9MMCzzQ3k7CBwbcGP7USBceLg7mDZYuw2xPvst/I979N
	b+8g66mgXBuS88rIVn9Plq0e3MyChCnJiTfF5hLxY8E+d9SvLDB84ADUgIGNjseHqlYwWfJ
	tmR7AtxAA4wdUIGpKbJfUHdOXkTVbh6/xU1WhB0XeqVQZyd+nFQO1YfBrcT9zN5+hJZ9w70
	Bd//1+MPe9aZHGNAEORJ45kux8IswI6843wFZnHq6z8aMuo7uVZ20bmNgmlPwOdbuiA/loc
	Z/LbjndXXAFjnKl/2L+JXnfMvNg5nOMNOyzn6wLSwZWGEN4iqg/PIZhTitZjP/ydJrRU+Tf
	iwuiuAQtoUTCPk3qpR6+hF4pTx+J34WAGpjRUUXg4zN5rcOxCAsGb8NwvOuaHZ7SULJKrgM
	790erfhbal2NQZ4up/pqIB4vztv2Vrio90yf2Gihzv6yvtdrfEYOpQNzCd11rhUj1weLwjX
	8n/SvjqmEPj3RxCneXGQ1+/tMuyBl/DmThrxhvvGJ02KH1W1a+P9fION/TDhS9zAQKwRbZc
	GGpwj/rKecEjbRU1czT+aGNHtJj6HFLb4+/ZHzMLAmmwkUXPkZ005V6xTOeJJtvfZnl+pZR
	QOA6k+2J/RXQ2MclzoDuoqQRV1W51e0zc8HOBjWZb5bNz42eB40ppkYmuGT2f4hW/O/CLVC
	Z3OR3hUznO+wd5+Wj+FdpCQUAIR0wXQ8mnqJnBkZ3sj6ofYse/flLmIbgAqvA2r/R9+O2NA
	fPWlTyZU6FR3rqUCLk1/HQYJnuc3oeKuBvP/gAJnP8vFUoRZuxM88UoxHV+P5BTeqfRpwrJ
	GBd8pQot46fWMaD9rFncAD0gpfqfzmL9TwDVw7NTsVo/TE4mar
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

hd3ss3220_regulator_control() enables the VBUS regulator when @on is
true and disables it when @on is false.  However, its error message uses
the opposite operation name, so an enable failure is reported as a
disable failure and vice versa.

Print the operation that was actually attempted.  Reporting the opposite
regulator operation on failures can mislead debugging of VBUS problems.

Fixes: 27fbc19e52b9 ("usb: typec: hd3ss3220: Enable VBUS based on role state")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/typec/hd3ss3220.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 3e39b800e6b5..d0de5a2488f9 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -218,7 +218,7 @@ static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
 
 	if (ret)
 		dev_err(hd3ss3220->dev,
-			"vbus regulator %s failed: %d\n", on ? "disable" : "enable", ret);
+			"vbus regulator %s failed: %d\n", on ? "enable" : "disable", ret);
 }
 
 static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
-- 
2.50.1

