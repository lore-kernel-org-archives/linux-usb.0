Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EDD36B906
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271885; cv=none; b=QU5zuFuh3Ef3FpqLuM+STj4XpXi6OjjdHYvsvo5vpnD8BnPfPx7wTPAj0oFZYL7TMTwMma0t8j5QWFdhrBNRPLZTqu3Xmy46YO9H6Ufu9Si2lLLhzmcJfcYLnJ2MuwzGQLXdAiCwf2M0pNHxH+ge5AtPovZRlnQH09WDRsmLh2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271885; c=relaxed/simple;
	bh=/tOkW6BmTepH8V021pwvSf58NbvG/glBde2N6Je6Uuk=;
	h=Message-ID:Date:From:To:Subject; b=OSnKDaBH+xKQRIbWVBwKQjk2mWEtXb6zD1h24IrpO7gh46sWwf2XLdIzXxsLCpZnIVhBbDoYuDQ7hOUH1TqD4FS9We9OQSNqHV+NlA5AzG2yLN+ytYdZ5Xb7ODiYCPwjKK1844UHoTkDHnnI4B2nphU1d7AKMlc281hEZeu6ZoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3hKo6oq; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3hKo6oq"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66d116f0de8so4451332d50.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 07:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788271883; x=1788876683; darn=vger.kernel.org;
        h=subject:to:from:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/tOkW6BmTepH8V021pwvSf58NbvG/glBde2N6Je6Uuk=;
        b=G3hKo6oqPkCfaQ4Q77Oc8oN1GCWuIlEV8EpFsCr3QyWny8uHNW66dzSowErCsG+G46
         8XGxp5+xl9SsCHZ/wskZbeW38ttw8Zyk7KqKvuhsO3ro+kyBymaJghjb6TjOTmdQUH9n
         vKSz/4G5XToP0/oUEkvJ1zRj221LJfNv0jWOC3i2SGGpEn+fwKQ0LIMX6V9pZWRPj/kE
         Xed/djGsquV0ItXncoasysjN2DEj6Ylp5GUkOqMR+WP6wsyB85BxxcyHaoHQpXG8LQyj
         o89jKnNLCBFVbsyAX+dPusOGvCqDSmaS9ERXCzbDlWlO8Opq/DE92AZ0iCKF9ANQJBsC
         kz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271883; x=1788876683;
        h=subject:to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/tOkW6BmTepH8V021pwvSf58NbvG/glBde2N6Je6Uuk=;
        b=OvuNBdZhPkCd9gMIyjHaP5FUdjAArlh4e1aEBd4mBMN46z9oI+wv1op2bIICEHQlzV
         QC4zMXgL/8yWghtHfOL5TtsQGaCp+/dhtNtXhv981vsKlbJm+JYgKA4LHJsxznzYpuDK
         iN+6v/lEqRag9Wd/d6520+/S+36Z7YW3fw/TwPgesiTNKYHA9YjAimU6vUNmrQFbAzyC
         8vU0rMpK81Jp1vdrGsFx4LcKNhXCh0BHL7HBtdceQ6f9TDoWT2oUfmt6wX9M+rIm39gM
         hFxPbOpoVIe7HX25MA0GHn+VrwpB76TcUX4s6thoEqu/Hp6zuzHwOT1cIbsbEAvOHcYJ
         Otqg==
X-Gm-Message-State: AFuF++n+dTUd26hjHVmy6ak1r5rNC6XsonKkMFsC7to9W/DfHfGY7dSU
	cZTb/PMFGVjKZ6TWaXILRse9gvil9dMescbDWmR36AJG//j5cPUbjCNtKEuLT2Soq9I=
X-Gm-Gg: AYBFou1Ex0ZDQrRqG3dpFEiwHEQbTy31uuR8QQxklF1K6+vu8WYUPqya6wG1dh21ioO
	0d83BYm0KI1JOnPUZs/8VFXAfGbdbXUKLV8Cpm2V4DK+DZiBNJ85jmazrHUZGz0ibw++QHziQEg
	SFjIGokCHpLL9p/8PAhti8vZp7Tqy5eXd0OIHUgUYlxHo91RK0IuXMMLJtk/Ru0+QCsSK6wK8Id
	F8AAZo8DNy1prmKuxw0SmrVd8PPvFxSW3KmYtIpbKyQsSwEeAU8DX7H9B6TYdADXjmCvuwafyE1
	AXfEm9SbsH+gSNa+egP6R9jJ+U4mcTtNV/ffvmIgStnA8Wxkzx3kBgbkd2iuS7EZ+lbmMGIg8Es
	lbe++bvtIW2ydhZg6M936UH0MsIQGsG3FZ6tMUO6I8oUDHgBzErfWZcx1dEYS8efgMXJSy3Qepl
	+kZaoBdRn/mO0aF7LHUZPOAoznjxgHOXqP05OBvkDeSRdQRtcr7+Y1nwzHL2fiaJJF4ftTnNQrt
	T3GW9xozb0y2YcbfPVt
X-Received: by 2002:a05:690e:4894:20b0:66f:7c64:9d47 with SMTP id 956f58d0204a3-66f875013e3mr2356698d50.23.1788271882305;
        Tue, 01 Sep 2026 07:11:22 -0700 (PDT)
Received: from localhost ([43.166.71.48])
        by smtp.gmail.com with UTF8SMTPSA id 956f58d0204a3-66e4ed13c39sm8441779d50.14.2026.09.01.07.11.21
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:11:22 -0700 (PDT)
Message-ID: <6a96dd0a.adf878b5.55e3a.b17c@mx.google.com>
Date: Tue, 01 Sep 2026 07:11:22 -0700 (PDT)
From: PayPal Service <shamsuddinidrisi8875@gmail.com>
X-Google-Original-From: PayPal Service
To: linux-usb@vger.kernel.org
Subject: Renewal Completed | $423.05 | Ref: I-L5IAFEA4I98HBI
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Dear linux-usb,

We hope this message finds you well. We’re reaching out to inform you that your subscription with PayPal Service is set to renew automatically very soon. As part of this process, a payment of 423.05 will be processed using the payment method currently associated with your account. This automatic renewal ensures that your access to PayPal Service services remains uninterrupted and that you continue to enjoy the full range of benefits and features that come with your membership. For your reference, your Subscription ID is 16K56798OR8491764E, and your Member ID is UID872492. If you have any questions, need to make updates to your account, or are considering cancelling your subscription, we kindly ask that you contact our support team before the renewal date to ensure we can assist you in time. Our customer support team is available and ready to help at +1-(830)-743-2940, and they will be happy to guide you through any changes you may need to make. Please note that this is an automated notification, and replies to this email are not monitored. Also, as a reminder, PayPal Service will never ask for your personal or sensitive information via email, so please be cautious with your information online. We thank you sincerely for being a part of the PayPal Service community and for your continued trust in our services. Your ongoing support means a great deal to us, and we’re committed to continuing to serve you with excellence.

Best regards,
The PayPal Service Team
36 Hawthorne Pl Montclair Nj 7042 United States
📞 +1-(830)-743-2940
