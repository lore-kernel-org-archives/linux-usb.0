Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E1F35C6AE
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 06:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786516782; cv=none; b=Rh/5P1SC85PR6BsZ1kUG340YMmmtzxOvXriXUkLZH7jstz23keSXbz3AjriBo25PyMiVXr7tMF/Cjmj0eXS1w4wH4m1mLG+MFYhQZN3CvyOdgQviO9tF+fYlJIqDUYSsfMuKd23nOTyDDG9dYWSysGMRGWFB2oY+OM//R3fm6tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786516782; c=relaxed/simple;
	bh=ku+XSt1vd9nlPsu7mVMAdjbcpCwPwXWImfM7HeOWHnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j4S5Cyc6Kl/YQ1K298Fkhoau66xezqqDpGTzdPLcxx0+zRtBzORJ8OICAhwFX8AW3xEkN4cjzqhUOMP+h5y7my0nipcCHoSorZzx9O0bjX6rJ/FcAeRBEZeYoF1H3SgW3yvS/oo3FTy6bJhB8ivTbQJGDKzrjDVm2dYkP3c3dcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAfDWCc+; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAfDWCc+"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81ff017d420so25544277b3.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 23:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786516780; x=1787121580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUf8hmD+XWqAHaZUL66gER7weV2oqqD92xBxq0FEFzs=;
        b=JAfDWCc+2CfGLcD10buGqAZCWqPSv8BrE7XC+pyJ6STWwct0D7agXEhsBybws5yO0p
         MbnQLijmafTjYPI/KsAQTI4o8vCeZDZHZC38Y3x2ZonYdhE9Ry7vFaBNy7vU8y9bXEc4
         TWsTOv61VwaJ80Ha4rvZK1zvrneKdwvzkUfJkqwUKCTyIvFBMRUuJWokyyuw1mCZobpp
         yBxkjIx2U/dKGUnyGg7Tkx2qBL53+2JPKqVmkjOYforHftwCQhd4wi+oJhjbSzrMCcz8
         /CuFznm7I2sccVL7KABV1KsibVUb1AKRHXtB7nk0I7Y4TL2Y0aOVqpyRUL8QuKYMvUgv
         Lw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786516780; x=1787121580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUf8hmD+XWqAHaZUL66gER7weV2oqqD92xBxq0FEFzs=;
        b=O2lQfPC58Xv/JhnvgzpqzPnENhYk/5QC0TKxov3oHgaoq/qE4rUg4mR7C5CQ5m/xRS
         PSBrI+1oBxFyQhyDHA6QnJSMZr1cP5Ba0c3ITSFXaN0MvbFvH7BTHQphZRbkrdjObe/9
         p1BHTAhvEw3mipKwF1pQNuLGpi5Vn8IHE6e9cnMU8sPW792YkbtLN4E3kYIfbT4GzWWV
         h0t15QDVoAodE7L4ImFb7FW/FnkrzqT0P+89ggHp1LsZIExhga+hmOsFdrgLDdFrJ08A
         mNN8XKJRW2v6+KFTLGtHLbJmgUfVVrn0Yc4UpOy5ZGrOdeYfjW3RZfGBpoWf0bq5wml+
         7hQA==
X-Forwarded-Encrypted: i=1; AHgh+Rpbyp9pDM8ZgbcWjHI27OZzcOcJ56s/TZlYRjFzeTSP4o50KaTzjpOSORJ92/ccDOMh4vVBH5nHeb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPK2yDNeUBPJ4kEU0apTdBaIOzvm9Op7pqoc7sp/ExxkrgZF2W
	p8dLLPJmE9WeW8Ww5ceGbKb/Q0RRhPvGMw4FP1RSFV0srVxOmqw3pssz
X-Gm-Gg: AR+sD12cJ83biuzsn13BKDV+Tjzft4XPcyWuf2w+WQXVZf5OCdV0Mdlg98x52E3wqNV
	11/QIEs67ztdNtaXyE+NK20JybeMaktOvbocPgbaShBQ048uX0Vkww8Pqu0/RjwGlHqqvr40iHL
	sTEval69/WOfsZPDtckb5KqJQHfX7+9HAxsTLLwICsSV8NyG9SccGWQwlWVTy6dV1vJLlzf9ZNE
	oOVeBw9WCiewQMb5L9EJHXgk8FSRDotr2p264a91k1xKJbGHr36rCbGXuKHKgQAlVnx2U/e9zkT
	4CPhTEGLjaUrEEy5R58e+NCUFs5uRIJIWBQrfw5TK1rOl9CuBzS/4JKVZty6JEE16F8ifrum4OD
	qODaHmYqeyqHxSHQqLzU1aS0Co/lW2LJsEH6G97hm7XOIo+s20HNOvl7pl5nANPKzVnRqdcVdTL
	AB50+42xv5zXuwfu3lfLhbHOJdBFiOdqsI1FQc0X6zQEewkPkzHZtITcwh30R3sygsj8YVK8SQL
	63XbSwqlgiRqbQllojTNHLFZMu0hQUaAuKingXc3hDLTvpmJSGpxwahbmmkiXR0kib5ZPi7Ve5q
	kmcMdfxq1cITs3UOTHyiA/zg8mtrv4Mg9hVjtoMUnpuKyIcitXjizS2D4W12z3pIHhKi3VLZBMF
	WG0y3kcOPVjs6PTt4WXaXUSDh
X-Received: by 2002:a05:690c:9684:b0:81e:bc7a:df50 with SMTP id 00721157ae682-8303f8d1a91mr41854527b3.3.1786516779730;
        Tue, 11 Aug 2026 23:39:39 -0700 (PDT)
Received: from localhost.localdomain (c-76-108-143-213.hsd1.fl.comcast.net. [76.108.143.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-830abb2e076sm8226137b3.47.2026.08.11.23.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 23:39:38 -0700 (PDT)
From: Jason Colapietro <jasoncola1@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>,
	Greg KH <greg@kroah.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 RESEND 2/2] usbip: apply list options regardless of order
Date: Wed, 12 Aug 2026 02:39:10 -0400
Message-ID: <20260812063910.31293-2-jasoncola1@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812063910.31293-1-jasoncola1@gmail.com>
References: <20260812063910.31293-1-jasoncola1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbip_list() acts on -r, -l and -d as soon as getopt_long() returns them,
so any option parsed afterwards is never seen. -p therefore only takes
effect when it precedes the mode selector: "usbip list -p -r <host>" is
parsable while "usbip list -r <host> -p" is not, and -l and -d behave the
same way. Nothing in the usage text suggests the order matters.

Record the requested mode during the option loop and run it once parsing
has finished, so -p applies wherever it appears on the command line. When
several mode selectors are given the first one still wins, as before.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Jason Colapietro <jasoncola1@gmail.com>
---
 tools/usb/usbip/src/usbip_list.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/tools/usb/usbip/src/usbip_list.c b/tools/usb/usbip/src/usbip_list.c
index b9d60b87e..632a968a0 100644
--- a/tools/usb/usbip/src/usbip_list.c
+++ b/tools/usb/usbip/src/usbip_list.c
@@ -343,6 +343,8 @@ int usbip_list(int argc, char *argv[])
 	};
 
 	bool parsable = false;
+	char *remote_host = NULL;
+	int action = 0;
 	int opt;
 	int ret = -1;
 
@@ -360,19 +362,36 @@ int usbip_list(int argc, char *argv[])
 			parsable = true;
 			break;
 		case 'r':
-			ret = list_exported_devices(optarg, parsable);
-			goto out;
+			if (!action) {
+				action = opt;
+				remote_host = optarg;
+			}
+			break;
 		case 'l':
-			ret = list_devices(parsable);
-			goto out;
 		case 'd':
-			ret = list_gadget_devices(parsable);
-			goto out;
+			if (!action)
+				action = opt;
+			break;
 		default:
 			goto err_out;
 		}
 	}
 
+	switch (action) {
+	case 'r':
+		ret = list_exported_devices(remote_host, parsable);
+		break;
+	case 'l':
+		ret = list_devices(parsable);
+		break;
+	case 'd':
+		ret = list_gadget_devices(parsable);
+		break;
+	default:
+		goto err_out;
+	}
+	goto out;
+
 err_out:
 	usbip_list_usage();
 out:
-- 
2.50.1 (Apple Git-155)

