Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2F936D503
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 17:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789579753; cv=none; b=Ue/QtsxrpDH8Zck+zBydaKRsPpwnJGKzOBGXJxuew1mB1fVvtZ5CFD54rY+1PoqCbrYo3T8MX3jd+YqKuR72TDk1WGiPrCXk0MbdF0mhdQqCZV3h6ohTLm2pYIjykisXofKPa7uONb3+ENgaEcz1UUghsyJV/dRl4DtF/dP1FEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789579753; c=relaxed/simple;
	bh=BUtOKTxFIQkOe0jmccHTs9lWssJf/74PG3MnQiHKRwg=;
	h=Message-ID:Date:From:To:Subject; b=ASA9xnofDzxAZsRJUfXTIQ9jYREe1mJAj5zQfzmEfnRY8nJMoojIbwl1t4YqD0d8UKW3LiAf62PHuOboBZ6xmJ9Gs7qONbT40/wJUGjtvlfYtwWvBAZgU48lkhJ/Jr43J4Z/nr0NHsz3NHr374ov8toptdCcpYDKWOiQ279Vo18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpIpOqP4; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpIpOqP4"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e504d59so431839e0c.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 10:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789579750; x=1790184550; darn=vger.kernel.org;
        h=subject:to:from:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BUtOKTxFIQkOe0jmccHTs9lWssJf/74PG3MnQiHKRwg=;
        b=WpIpOqP4hLayf9rvpNIfUyyPBDwN8RYeUTsZXBChXw2TuiOASHbBf9cQ4MvaDjRSHG
         L8DZp0CwJv4X8Jyo0Lf8YKakE5y/6IsdNymY1nQA/NXFtLRZQl6COgViYx2Hs6qUtm6A
         8Rjpnhr4cT0qe+0ReNTmCJD5MQHZlNdhSUAWVNuLblhnQbRnOIHvUxaNPjn8cayiaHZE
         dNKnHddq0T4KN6CuP0IkEqBulA/qhyJ/UafyYdPpnegwq9zIKnFHk0jC3317Ao2coOz6
         pAptbZkryMmjXnhf7Hr408+d5Zu28EXzTL8wXP5s3iWhqa/ZnptmTa9ev/nc3aWDf97r
         Xk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789579750; x=1790184550;
        h=subject:to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BUtOKTxFIQkOe0jmccHTs9lWssJf/74PG3MnQiHKRwg=;
        b=jZMLArO5M7rwcLwGuAllRDyocL2e6pBugD6Mros+xssbyyruXOZ5ZoHyHrjlBZqhl5
         AvRllsp1/qSXacJV9SN4CKo70bwhqMhwQzJOQ78kYBCep/LiICaXgBZHiIWuJJrPWE1i
         zGveX/5F0fk+QXmbTswsPMeK5mJFZJgZjd4DeRJcf3vouVgFolcHe8MhmG/PxKJFcy0k
         D/+iYMBpQBTjsYvw3rFU+lWoY4HHFLkTzopAXDzmSPc6UAZM5oYR8ajZHPDAjt1SDsgR
         BhEyexQFwGbgWDCyVC5ip0Y9OiCSENna2hGtQdAyL5QnL0sEzENe8roHkbGkcSWPLJuT
         okPg==
X-Gm-Message-State: AFuF++nmhEhK/dGyPT8RP+xCyV6Bzz6nZ5t+x6I9KXLMaYJIDCvw91Ea
	rMlNUjfA+m+NHysKnQPv8dWHeLyXNkvGORg97NVQrOD9x0LCUsfeShwoCSgoYJcd
X-Gm-Gg: AYBFou0tAQJ39lUgxo9q5AEAklKdVO2uQF+JyUltY4ysT76mxbsqZvTIoHe3SzSzjSi
	sRP9Iv+3hmRny4TIF6eXUiUbPXlcAx11TlGJ5lQwVUacxzeKoQEdV1MQrk5fEkCXzimjgIqrG9l
	cWy/7fb/X6HSvmy+APbEbpmAQLo3RCxe4cl76m6ZucKxqdtyX9jE9kFKb390vv7jcT/8hj3bP7/
	Ch4TPopwSGCrSfGGyYroaKSgppHELrFhk7TNVKxq7BTAj+cAJ5a/Y0QjQoZBO8MHxcW2zBKtEiM
	QINVuQqkeGWFf61mdQwWWPsCIZUB9LPkcqGpsixLr3x9x452IBCtAofUGNc/4PlFu186Zu5Oida
	f6kHlrIjtNSjIhftzsDkonbZQTD2ssICpfQimtaqVaXPjITn75nheliunFCg63Ce7fB6LTZBbeT
	qA4rHG+Mn3yle+u0+DeBvAz7Ytw5/TGPckBz3RWwR6iKktp33pGaCLN3wHLQJEfLWZT55peR8p5
	1cIWTH/SURrU+L6Z8B+JcQRt0rQzrJY
X-Received: by 2002:a05:6122:6091:b0:5c9:66f7:2f23 with SMTP id 71dfb90a1353d-5c99ab6c983mr4672662e0c.2.1789579750172;
        Wed, 16 Sep 2026 10:29:10 -0700 (PDT)
Received: from localhost ([43.157.151.93])
        by smtp.gmail.com with UTF8SMTPSA id a1e0cc1a2514c-98323524dafsm394111241.7.2026.09.16.10.29.08
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 10:29:09 -0700 (PDT)
Message-ID: <6aaad1e5.be41e256.d1205.9df1@mx.google.com>
Date: Wed, 16 Sep 2026 10:29:09 -0700 (PDT)
From: munnawhere90@gmail.com
X-Google-Original-From: PayPal
To: linux-usb@vger.kernel.org
Subject: Invoice Generated | $496.13 | Ref: I-78NJ93RR32UZ1H
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Dear linux-usb,

Your PayPal subscription is scheduled for renewal, and a payment of 496.13 USD will be processed within the next 24 hours for another year of service.

Renewal Details:

Service: Bitcoin

Account: linux-usbHello linux-usb,

Thank you for your recent purchase with PayPal.
We’re confirming that your payment has been successfully received via PayPal.

Transaction Details
Date: 2026-09-16
Transaction ID: I-UMM37L8FGPTBKUYGX
Payment Method: Pay.Pal
Amount Charged: $496.13 USD
Item: Bitcoin
Quantity: 0.05 BTC
Total: $496.13 USD

A confirmation receipt has been sent to your registered email address: linux-usb@vger.kernel.org.

If you have any questions or need assistance, feel free to contact our support team at 804-409-7943.
You may also view your order or manage preferences by logging into your account.

Merchant: linux-usb
Shipping/Billing Address: 2140 Cedar Creek Rd Creedmoor Nc 27522 United States

Thank you for choosing PayPal.

Best regards,
The PayPal Team
