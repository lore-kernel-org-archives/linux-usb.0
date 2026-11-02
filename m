Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=71.18.227.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629052;
	b=hf60RWVbS9uszCmC79pjEuLG+8lGcgYHXWV4V56NQfLtZY1iT/FCugTUjteva8WWflkB
	 waDFlAG0A/0TqC2BcLVkUQ5pvR5DI8n0jo60TefnWrrHUzBvzFALoII5ofvNJEMGSHMyO
	 ZmIyNtoo8YK17dfNlg6TvMmXn3DMLuRnhIrHvxNUB13NulfJSajp+683B84Z4Qz7ust0e
	 bfEN7aFs540hgwRD2DX2hEIBIq5J+rWvvbqbJsa2BQ8rRBd4Q6gGhEetM1qFtV8hAZn6w
	 qeIwVOubh3WcYIwDdCc+WIevcXsd4faA6EhLYUITYqK5PIgJGGtdoyC2/o3/gC8PAGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629052;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Transfer-Encoding:
	 Subject:Date:Mime-Version:X-B4-Tracking:Cc:X-Change-Id:X-Mailer:
	 X-Lms-Return-Path:X-Original-From:Content-Type:To:From:Message-Id;
	bh=UETLk1dQekRKIibLsMQYa9UEIKc8XT6x173PcXv7ydk=;
	b=GauQA3QZbY4T17y1nGI3fxuOJnM0XtgvrsAtfUdnabOvqJF8uemhGNHYpv5YPbU0Lk7b
	 4hhryuSqUTDT2YDEVsvI9xGb4iJ7bo982FaEjHWEd05UJLAR7r5SMo4fN7vMmulMT93bX
	 5YHyV+aE/JHNM3IVJRctKs2ZteRHrD1uf6VASLmDfqUhdf0NIowoF8NjwGO5liRBkpJwF
	 1+ZU12PSNrfDsDJQ4xeLNFoUbtA5rHVFGmdzU9V2QhH2sl4v3CTMgGHk5PqB48u03KUOJ
	 xnHuHa2qbQBPcVjMgCQIJjRQ2mvyzAKeuca2bMqPNxo+DqlPXkJuYWQcqkYuvh7ANLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherr.cc;
	spf=pass smtp.mailfrom=cherr.cc;
	dkim=pass header.d=cherr.cc header.i=@cherr.cc header.a=rsa-sha256 header.s=feishu2604220257 header.b=JY0Q4JGk;
	arc=none smtp.remote-ip=71.18.227.1
Received: from sg-2-1.ptr.blmpb.com (sg-2-1.ptr.blmpb.com [71.18.227.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC94606B5C7
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 14:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC94606B5C7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cherr.cc header.i=@cherr.cc header.a=rsa-sha256 header.s=feishu2604220257 header.b=JY0Q4JGk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1793629040; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=UETLk1dQekRKIibLsMQYa9UEIKc8XT6x173PcXv7ydk=;
 b=JY0Q4JGkbzEoqaB5iqiyXIOHU6WLKEi2rncgK0ZIGJ7nGHZMghZxKeE7nVBtbdfrXkOjqK
 QlR+QRx0S2zaOkj9VfN5oIhpoJ4q11o09bYiUGjseJsMbhavExaRch6aMjRF5Tx1POtdLD
 +C6ggqPkXOuTu0mAEV0kJgj+qXxULtivKXfk0vPzcapaGh0VOmMKPeg5b6T/Fhkdmt0I+3
 /Qvd8IDzsQqS1NcoUKfdkkX08xXJQsmbOSzqCTCUgKpOm+MVd/fjbHCvvSj/jb/wCvj78/
 YuFbki68SXI9EuNOJhJDgB9l3C9cJcmfxg52qeUhB3YYATUdEwrd5j3kvDwBoQ==
Received: from [127.0.1.1] ([111.42.148.145]) by smtp.feishu.cn with ESMTPS; Mon, 02 Nov 2026 22:17:18 +0800
Content-Transfer-Encoding: 7bit
Subject: [PATCH v2] HID: pidff: fix undefined shift for infinite duration
Date: Mon, 02 Nov 2026 22:17:11 +0800
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGab6GoC/yXMQQqDQAyF4atI1gZ0iDJ4leLCcZIaF1YmYymId +/ULj947z/BOCkbDNUJid9q+toKXF3BvEzbk1FjMbjG9W3jPAbCXaMIxiNNuazRFpWMPgpJT11 L5KG898Sin7v8GP+2I6w8518OrusLASO2RHsAAAA=
Cc: <linux-input@vger.kernel.org>, <linux-usb@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
X-Change-Id: 20261028-b4-pidff-duration-shift-8df4f6451448
X-Mailer: b4 0.16.0
X-Lms-Return-Path: <lba+26ae89b6f+73fd85+vger.kernel.org+me@cherr.cc>
X-Original-From: Shengzhuo Wei <me@cherr.cc>
Content-Type: text/plain; charset=UTF-8
To: =?utf-8?q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>, 
	"Oleg Makarenko" <oleg@makarenk.ooo>, "Jiri Kosina" <jikos@kernel.org>, 
	"Benjamin Tissoires" <bentiss@kernel.org>
From: "Shengzhuo Wei" <me@cherr.cc>
Message-Id: <20261102-b4-pidff-duration-shift-v2-1-83c5f8c67484@cherr.cc>

pidff_set_duration() computes the infinite duration as
(1U << report_size) - 1, but report_size comes from the device's
report descriptor and can be 32 or greater. This causes an undefined
shift. A UHID test on x86-64 triggers UBSAN and programs a 32-bit
duration field as zero instead of 0xffffffff.

For report sizes of 32 or more, store -1 in the s32 field value to
set all 32 bits without shifting. Keep the existing calculation for
smaller fields.

Fixes: 1a575044d516 ("HID: pidff: Compute INFINITE value instead of using hardcoded 0xffff")
Cc: stable@vger.kernel.org
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
---
Changes in v2:
- Swap the branch order so the default operation is unguarded,
  as suggested by Tomasz in review.

v1: https://lore.kernel.org/r/20261028-b4-pidff-duration-shift-v1-1-65028c6b4a37@cherr.cc
---
 drivers/hid/usbhid/hid-pidff.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 22951b7ecd17..50906890fdad 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -394,7 +394,9 @@ static void pidff_set_duration(struct pidff_usage *usage, u16 duration)
 {
 	/* PID defines INFINITE as the max possible value for duration field */
 	if (pidff_is_duration_infinite(duration)) {
-		usage->value[0] = (1U << usage->field->report_size) - 1;
+		usage->value[0] = -1;
+		if (usage->field->report_size < 32)
+			usage->value[0] = (1U << usage->field->report_size) - 1;
 		return;
 	}
 

---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261028-b4-pidff-duration-shift-8df4f6451448

Best regards,
--  
Shengzhuo Wei <me@cherr.cc>
