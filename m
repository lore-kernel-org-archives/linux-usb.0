Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5ED345EC6
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788594982; cv=none; b=REzLNCa3ae8jCqxRWQNmgHNpLk93eq5MONKtCepQDj912cyVXAGsa1ZOvc0BujboZE70YUQHB/G6sXdx5pAHjwvuRBZOZ9TcZ4fwU8GufwxnVU/TBzpTrBDMuxLiSql8dfF73hxrHzP3K6BUl7A66FOyQtdek7uJgiNFCzrlUVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788594982; c=relaxed/simple;
	bh=DzQIokuIuiebBoqlyi2mm9lq/znnuSYXVgUpbFffS0I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f2OwBon6MAPxCIuJw34u2YILnHiOQRDGPUyzHS1+RL1T2wnDWaWpkxdWOEsjPZV7dgeOuRwcHdYOWUn2cqkTqKRZTkOHnsvEmcJh8TS6tRllxehIs3AoIxuFm+hSTYQ4OlTxUxo+lwrLom/5rUVccIJJzwIxJxtssGhaGh8+MLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGwQIY4A; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGwQIY4A"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4858be8b509so690721f8f.0
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 00:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788594979; x=1789199779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bPLAs8/W3BrTIfsm4m/UzvMsFkHC6fddEYHJW0htW28=;
        b=LGwQIY4AWyl9OMnJNYsKguT3Df6NlpTP3lkND/HZicPGk3BGUCw5qA6WiwUTIyCAMg
         OVZym8TwKI7vTN24D+jIu2mqY+zpUCRmitY3NHpjR43btxxoSyh8Z/JdH6pRlRqe6ihV
         lFCFLAxYZCiZ1POA/gi/0AFfg9H1pAYGRHCNUd0r6Lx0dam2LjXYfWR0gxBBsZYh77ih
         ktNoDWUpRTM4eyYuhIQnBgg5dCS/K6+h4aCZC4MWtuEow4SHbUMPSFoK/X6Du622cZsK
         D9aDAtaroPVXZ4WHYYZAigu5+NLwFsfOiowYt2hnHGwqVs+mojT5J6VZslW2zfMPnYHy
         UAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788594979; x=1789199779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPLAs8/W3BrTIfsm4m/UzvMsFkHC6fddEYHJW0htW28=;
        b=sCzh7AflPWGpP3bm7I75z0MRgoxVFo5DfuU7XAXdJJImee/VXXblsI8IjXmJwuXEmb
         wfeunXweuDhXBaaoo7/fxscpFb1hY/ppuGhV6zmnTbYpgg/YdfM3YBYF1fRslNc/j4ea
         t+wsycKMIpBPaCaFY5sTu341ac9ZPE5FV1Jq3rGgVxPzlcVylZZzMqf8J+cDRAHxMWwW
         V/zqXkpJIsJeXJf08q3wue4NDrC4yM9lV9ABzH8ClNp6vITAsp9G0E2e1Po8FfZO9yI4
         D6fDmCDzbn7RBqzE9OeZ0VhMn6Dv8XLxgETVGS2zM8cHhpfYWdrSLuwQ5KXxwu0e4WF3
         kwoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxg/ZLqdMH0eG4HkUtbxg4zF9khNubeke4qaZ7x1HxDucnbuSgqiuHUTX2PQIXdt21DqIPrJvgGkx8=@vger.kernel.org
X-Gm-Message-State: AFuF++klDbK9S1eEtcLSfKHFjvivw9cCSjpQSFc0/9LcRzx058KnmJ7n
	rs/L2oAtUr6kAsrQL7rDbBdlH+Zeu8iaLb1wzPAoeK7NhlY/yGdynFaDzVR2ygro
X-Gm-Gg: AYBFou24mHuSUomG9HSI1ZLYq3hSsFkQZKGPwYeOKQcinWdkwESwFrkfxCRt0rLuQ7M
	6cv7gmnda3Swx4ZDV/R2w+3RtB+wyty8YWj9+VlUPBPUZe1X1aIVSpE6jzTXfkq+E0vDVTPWyp+
	VLr5wTCPAussqvfSM9l5Afv/t/dUHye7jbBqUwhXFGElwdoLqraAKbb26OifIzB3V3npg3MAIiw
	Im9UBQcsdJ1X+VZT4qoLlz5uCxAWwHscqkb24exEMEWQiF7ou19/4rgcfB2sKJNGuJUkIGrRVbe
	gsVHoBYgJ/L0Lr5oLRbxC7Laq4nOAtgbnXHQafu5ICP9ikgaY1AqU533phXhmOcosY+PNjJMdSx
	LKcJEnyM54olfTJ6LYfdamnKkQM5FF5hCJZ560ud23my08lHtJKsfMO4KH1VmIUNjIgup+Kw0cs
	ryC15viSw3pN6ixKrKWrdNVna3t9MAZIV5xeCf0pJ3lcvP3NVKwvFnRPVRRF4+FKm2jLPnA86Qb
	zC5xwpyoz/rZr4xQNnlbf47FxPQhklFfHuI9J5W7iZHQqpTXUvTvpi6DW1icdC7DJjleME5KPLm
	1P6pcM8saQPlWXvJHrS3tnIcWasSm8F9vxt2kdwazZHDmjB544xKRfZxg+f9HpmlkiI=
X-Received: by 2002:a05:6000:26d3:b0:484:4146:1422 with SMTP id ffacd0b85a97d-485870934f4mr12842922f8f.21.1788594978754;
        Sat, 05 Sep 2026 00:56:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm1669311f8f.15.2026.09.05.00.56.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:56:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Pete Zaitcev <zaitcev@redhat.com>,
	linux-usb@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: usbmon: Fix a typo in the example
Date: Sat,  5 Sep 2026 09:56:09 +0200
Message-Id: <20260905075609.32879-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct ubsmon_packet does not exist; the name is struct usbmon_packet.

Use struct usbmon_packet.

Fixes: 6f23ee1fefdc ("USB: add binary API to usbmon")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/usb/usbmon.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/usb/usbmon.rst b/Documentation/usb/usbmon.rst
index 6d5ec1e62d09..667b84d3ae56 100644
--- a/Documentation/usb/usbmon.rst
+++ b/Documentation/usb/usbmon.rst
@@ -361,7 +361,7 @@ Then, execute a loop similar to the one written in pseudo-code below::
       ioctl(fd, MON_IOCX_MFETCH, &fetch);   // Process errors, too
       nflush = fetch.nfetch;       // This many packets to flush when done
       for (i = 0; i < nflush; i++) {
-         hdr = (struct ubsmon_packet *) &mmap_area[vec[i]];
+         hdr = (struct usbmon_packet *) &mmap_area[vec[i]];
          if (hdr->type == '@')     // Filler packet
             continue;
          caddr_t data = &mmap_area[vec[i]] + 64;
-- 
2.53.0

