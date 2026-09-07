Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABBD379C40
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 04:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756424; cv=none; b=Jr60vbZ3EkI1QNxHsRWtvTDF6MMkbuTSQ1QLaLG+405AYpCs3wOM/apQV2HJQUDE9Wgof33re5uuzyarzimMagfDsTttjLCowzJzIAe15FW6IwLQGcKjvcVoepwmATGhfecllvip64XRWphHoDLePfGqBu7O+YBpu5JbJqkcVQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756424; c=relaxed/simple;
	bh=Z06AU703GpEoGKRxtsmSf1YbAroc9JADJQ2ixTS8Gco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HrItuGaetDbInAhfcMrheGTYy+L4PqR5F6DIX8XGGFre/64+SusZPiAv5XAek/xOleIMqIrBKqSf1cwJzyLC8NEN7BWGSjhw+OkEeksZnRW/h3PgwMgxXgwuuUXXRbQBDQ/OjuEbUc+0rx21Fd6iWgshRo3TsumgUF3pe7FXBGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSi/9XQ7; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSi/9XQ7"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d5cad1a6baso26362645ad.3
        for <linux-usb@vger.kernel.org>; Sun, 06 Sep 2026 21:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756420; x=1789361220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUWvG334OUn3r/8S18NDwduytcXyDvAPPHJtvp6mqTs=;
        b=lSi/9XQ7/O5MzmTuGA+rJ2d0GWoIDo8lM18q0Mt206Gjh5MPADchmN83Pn0lu908wL
         OpKe/7b3IIQT1KEpdFm0V3U8pG1GkXppYHobXSubN4mdVjkI3Mnlmzzqg8OFzHJlY6hW
         Y8nkgVLlf7wLKHnSvq5/81jIr+wZQu2Zx7aIq2VIBDxcLJe6IFUBzfn4wbHIrXuL+ZVk
         J4idI275FjA2VjqTRxaXSd2fN5GsLQQ60bmU9ZRhnEewbTs78Nzlt1+17SchaKGmWUMm
         XMGJCUAIPQLmt9Tzyqi98Nj8Og/mY06ccayNjmhNB6qsdiHswKrCLevf2kAhr35GO2e1
         yVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756420; x=1789361220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUWvG334OUn3r/8S18NDwduytcXyDvAPPHJtvp6mqTs=;
        b=sBaAwmd3BXzHSQQQZkAT1TSUPI6tqeuA6mZAnuENsMZWQbhid08ffUnZqqagVhgyp+
         un8QXBFIeECWV44PymYP7lUFUfljlGni0nAovg1lbHLu/AEJCXhCcMByI7bClfqapg6M
         QR3BZwctTGrYXumVHR9varBGrVU7NLU9DSg1Jlw7dKALmjfVHth65WhYZNLvkM4cPPLC
         vMHpCXaNFDUJLXBu/YOOeWzMNh+LTwgCl9+pFcgJe3NY+blpxoDBwih951n/xt1D3DZP
         LTqmhnuMEBm0rKCmMK+1dr+Is9Fskm71cOa2wh5xfYdPWVMgkggACqga0UKYjLCEpj+l
         37EA==
X-Forwarded-Encrypted: i=1; AKwUvBwGZ336SKm3/vJeCJ7So2jBU9g/Z3DP0Q5kOyyRunQGqrqkhY1/PxLK9DvrLYhMkAeh8R/Ik+5FUTg=@vger.kernel.org
X-Gm-Message-State: AFuF++nSUGiahnLGwLxHjqccJbV7N8GKudU4i5+OBVgCQjgCvWqcFtFx
	3u2vWKMFas2vN3eUYV6ISsB57FV2eUSWqWqkisWfMGd9zniRJDHmDaVU
X-Gm-Gg: AYBFou0K/QmrlugsgO6tdznjLxWYX5c/1ZK2CZimupT9N3OSrNHB1mgX1IQI1bNlYls
	Ygy/skyZaZKXwOLqckNO5xkE0qwJM86qWXueL59KgtF6SluTpSfQ0xnQkRHM5z1Cyc6TXLXnnrx
	b0xGH5mE7YpHJqDsiU/K4cvD7coB3CP9B4lANO4SnADNj0rjvvV8bYA7T/Di9PyLT8n1Fq6rB3g
	rpTrbzE7IOnIY89cM8lp99YnTF7NIQzlKjDyNvIDNKCFZ5/ov2+8tq/jeJyCz7VaKaCSmt6idRA
	98SnYILXRdlYP+Vlr73J4/nhf/IPII0HV9MU6acbFf81RrgirxmsgT4+6e3w96N5qeL/Zr3YMcT
	OdxKJPjRFXtijgPmePd9J3FuAWl80LtdnIHDlWN+YQwQKWGX1mUdXoCbidBSKN0+kBmeXcIrdWB
	6Akv9eZrmoqcBsN0p148FnZG6OShjLzT1dfmQaDqTQTQcDofw1LZGd3pEBCBlDlkghAr+8czGb8
	i2AzOxbO8eBGQ==
X-Received: by 2002:a17:902:f546:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2db1212aa5bmr305439335ad.0.1788756420050;
        Sun, 06 Sep 2026 21:47:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37844565eec.16.2026.09.06.21.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:46:59 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-kselftest@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 3/6] net: llc: fix repeated word 'all' in comment
Date: Mon,  7 Sep 2026 10:16:32 +0530
Message-ID: <20260907044635.7141-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907044635.7141-1-hemanth.selam@gmail.com>
References: <20260907044635.7141-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'all', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 net/llc/llc_conn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/llc/llc_conn.c b/net/llc/llc_conn.c
index 260460d50f54..4b6fe9a473cb 100644
--- a/net/llc/llc_conn.c
+++ b/net/llc/llc_conn.c
@@ -193,7 +193,7 @@ void llc_conn_rtn_pdu(struct sock *sk, struct sk_buff *skb)
 }
 
 /**
- *	llc_conn_resend_i_pdu_as_cmd - resend all all unacknowledged I PDUs
+ *	llc_conn_resend_i_pdu_as_cmd - resend all unacknowledged I PDUs
  *	@sk: active connection
  *	@nr: NR
  *	@first_p_bit: p_bit value of first pdu
