Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EAC1C5D59
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 15:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056594; cv=none; b=FoktG8gOLguX3z+ykVYXOhveiKwn0/RbBqkL2puaUOjbpTrES9oOLrowu7QAvujbFbsGgQkjI1PwRhKgT5c0WQaGZYuP1eEd+t1tVv7f5l1RBFGMEmOs308URBXSsSuWKloi+9tPKcoyJSegKsVPAulvHmJL7gJWsvtoT4QBINo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056594; c=relaxed/simple;
	bh=6ifGHVd8yFd6zIWxc4ZViS+GY8PKrElpE2KM9bENktU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fbmrYN6H5Ow0ZiMbpJaN36Ygqzf+RWwKKVaUMNrO/ADXBX9ZQLrlttj9YLl2rnyeEc8wqC65WQ9O5LIqO87cMP05YLfSlIyf0WIn5ILL5o4njNd7FHUEMU9B+34LaZsXmNG7fFd9UNfsqFkiQcF1ZX4CE8XZ0usTrYhlbKQTbK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzVg2NRq; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzVg2NRq"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-356337f058aso4197785a91.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 08:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775056592; x=1775661392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUFTqdJn8mcrBUZby6jS6F6Vwmr7Idr0tA1VeYE5pFs=;
        b=BzVg2NRq3RW18sttTvoEPElbh2uqWfLiQL9XrN3MkI9QIX1f3l7tpS1ah+q5oIqoh5
         nXmdNEmPnPpefKOBt/t/IFEQ9HGrE+bjBRv3vQNlro8T1+ajiS1ZEQn9KanW2px15y2P
         Vm5tcS5dnhWWOh6zOciWslDyHGK9WaY7i+EhoJxvYT3N5mNqJ8nRVld/jzGwxoNAri0U
         MuEAqv5cVesjQQ+snKbRtv6iMbA+quo85nQtn3NzhJivcPwIgq0/DPW6klS5REXHC5vI
         qCiv3JT1SlXBcMZRFlOwYNScP5Bjhk+XfXU0wOekKGbPsnBCDGGiRWbjzc0fU9mLhmJz
         Xt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775056592; x=1775661392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OUFTqdJn8mcrBUZby6jS6F6Vwmr7Idr0tA1VeYE5pFs=;
        b=fae07pdfdXZCFllzfNGZfGsulyYua6vkzejWJOCLt+kcmt5t8kuL7KZujKZGKGAkEx
         TBOr7Z/wUPynRnRZSc6SL6vefz0HVElZzWx75MyZG7RRVOpoGzIhnoZMRpQAi1lw6hDp
         InmTPhwa6KZYSxx1tI7zpAf6OVh67CZAsQ6hLPgW2HcAUC78f6Q7QCIAWB7P85Uwbywk
         9WiOJqEQF/coSFSluGL7heZaZAQKxFsnBabuVVzcXjZPHIV+jh19/s47gZNMZjTksGlJ
         j1ZgbYbfDnNe7Mwp96HCCq66Mm16eg5fYtBGIpZS6CuAfM7SvOvIRXx16EF+ewbECWNI
         bytg==
X-Gm-Message-State: AOJu0YyTceZe+NxypE00punk5Gm0HoEBtah4rbgszmyL8dhHGv2dWKTD
	do3Zpe6FUgRB2J6+tKbp5lYmqMQ6zIFK9NTTrfWus05O9dg+0mRbJ6v4
X-Gm-Gg: ATEYQzyt5zTktYbUdxl3FX4r90GFEoGFPhbgJNVPC2JeS7xgJChL/d61ij6mYceCXdB
	5ZzbVsdsVR3qkO8udlz3V6gn8raKuCUFb+0hRf5vS+8KLL9c+JzX+HRmYgpK9gpvWS6DJuLnEr+
	+wW9zgNavISMeQ++/JkJdGYeilpkBmo9wx6AoqY18M4dCuvEkblBVxXrGEcPwuQf0D7gBXtUYMQ
	mMhsexsdrKJkddnjBWRZrsRvA8FJnUMT0UqeVmqT+2Osw0RCdFjqXH44OFIIpGo+OI6XnzbZg5O
	aCsdZNalFpEnBHA3+QMdnhgMsgFgzJDsEF3gOBOsmsIrhI7aV/KVJbofSALoEOheXCcYNzVQBLP
	e0z/0S0mplGORAEUgMthMCbZlW45EcI8YBbvfQiKcrdxqkxqR+mRtLfMQ8WW91lOpHzJSdQIbe7
	0PtIkTIYa26CiZczzatXfRzR6KMTAYolyPozHE
X-Received: by 2002:a17:90b:3949:b0:35d:90c4:59f3 with SMTP id 98e67ed59e1d1-35dc6e9e3e9mr3809028a91.13.1775056592033;
        Wed, 01 Apr 2026 08:16:32 -0700 (PDT)
Received: from localhost.localdomain ([220.83.29.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a1e9csm671985ad.55.2026.04.01.08.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 08:16:31 -0700 (PDT)
From: Taegu Ha <hataegu0826@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Taegu Ha <hataegu0826@gmail.com>
Subject: [PATCH v2] usb: gadget: f_uac1_legacy: validate control request size
Date: Thu,  2 Apr 2026 00:15:39 +0900
Message-ID: <20260401151539.3441000-1-hataegu0826@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026040124-unheated-opponent-3c56@gregkh>
References: <2026040124-unheated-opponent-3c56@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f_audio_complete() copies req->length bytes into a 4-byte stack
variable:

  u32 data = 0;
  memcpy(&data, req->buf, req->length);

req->length is derived from the host-controlled USB request path,
which can lead to a stack out-of-bounds write.

Validate req->actual against the expected payload size for the
supported control selectors and decode only the expected amount
of data.

This avoids copying a host-influenced length into a fixed-size
stack object.

Signed-off-by: Taegu Ha <hataegu0826@gmail.com>

Changes in v2:
- rewrite the validation logic into a switch on control type
- use constant-size memcpy() for fixed-size payloads
- convert the volume payload with le16_to_cpu()

Build-tested: not tested, build environment not prepared

---
 drivers/usb/gadget/function/f_uac1_legacy.c | 47 ++++++++++++++++-----
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index a0c953a99727..00cc7161db66 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -360,19 +360,46 @@ static int f_audio_out_ep_complete(struct usb_ep *ep, struct usb_request *req)
 static void f_audio_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	struct f_audio *audio = req->context;
-	int status = req->status;
-	u32 data = 0;
 	struct usb_ep *out_ep = audio->out_ep;
 
-	switch (status) {
-
-	case 0:				/* normal completion? */
-		if (ep == out_ep)
+	switch (req->status) {
+	case 0:
+		if (ep == out_ep) {
 			f_audio_out_ep_complete(ep, req);
-		else if (audio->set_con) {
-			memcpy(&data, req->buf, req->length);
-			audio->set_con->set(audio->set_con, audio->set_cmd,
-					le16_to_cpu(data));
+		} else if (audio->set_con) {
+			struct usb_audio_control *con = audio->set_con;
+			u8 type = con->type;
+			u32 data = 0;
+			bool valid_request = false;
+
+			switch (type) {
+			case UAC_FU_MUTE: {
+				u8 value;
+
+				if (req->actual == sizeof(value)) {
+					memcpy(&value, req->buf, sizeof(value));
+					data = value;
+					valid_request = true;
+				}
+				break;
+			}
+			case UAC_FU_VOLUME: {
+				__le16 value;
+
+				if (req->actual == sizeof(value)) {
+					memcpy(&value, req->buf, sizeof(value));
+					data = le16_to_cpu(value);
+					valid_request = true;
+				}
+				break;
+			}
+			}
+
+			if (valid_request)
+				con->set(con, audio->set_cmd, data);
+			else
+				usb_ep_set_halt(ep);
+
 			audio->set_con = NULL;
 		}
 		break;
-- 
2.43.0

