Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133F1364CB
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 16:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6sduuO3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C8AC433C9;
	Wed, 13 Dec 2023 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702485778;
	bh=9hIznFcw8DaH/AT2cUPzctof/XKOI1gZcHfpU8gxwaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D6sduuO3AhilOynckvUN791n2U8Y+YaO3mW522cT/m1JUmQEpDCLOCrW5Cbge2pzE
	 wCeH4/KlBpDTS75d7/yK4zhfzS3jtlWJ/4nv2aRg+1voRfHkDtx9HoV55S1iI8CAn6
	 FYj0fOh+aYgp3wSNEDlKQ8IEkwLy1m5upNThpQqwLWHrORUGTzDLdQpG7pbcUvSl/X
	 H3u8eXWfQSTY2LWM6oGkjZjJOnlF/R4zBoI4IO1k5aLy7RaKi8lGt5fPAl9yZMZpAB
	 Ig+ngBEtwwDSiUsmbroyS6nTForV/Biy0aj/61+WxgtHuNBQqRQ/YtU4Cbgi9UIu47
	 cm2orOSHOmxcQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 01/12] usb: gadget: configfs: Replace snprintf() with the safer scnprintf() variant
Date: Wed, 13 Dec 2023 16:42:30 +0000
Message-ID: <20231213164246.1021885-2-lee@kernel.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231213164246.1021885-1-lee@kernel.org>
References: <20231213164246.1021885-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a general misunderstanding amongst engineers that {v}snprintf()
returns the length of the data *actually* encoded into the destination
array.  However, as per the C99 standard {v}snprintf() really returns
the length of the data that *would have been* written if there were
enough space for it.  This misunderstanding has led to buffer-overruns
in the past.  It's generally considered safer to use the {v}scnprintf()
variants in their place (or even sprintf() in simple cases).  So let's
do that.

Link: https://lwn.net/Articles/69419/
Link: https://github.com/KSPP/linux/issues/105
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/usb/gadget/configfs.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index b7d2a1313a684..ce3cfa1f36f51 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -606,10 +606,11 @@ static struct config_group *function_make(
 	char *instance_name;
 	int ret;
 
-	ret = snprintf(buf, MAX_NAME_LEN, "%s", name);
-	if (ret >= MAX_NAME_LEN)
+	if (strlen(name) >= MAX_NAME_LEN)
 		return ERR_PTR(-ENAMETOOLONG);
 
+	scnprintf(buf, MAX_NAME_LEN, "%s", name);
+
 	func_name = buf;
 	instance_name = strchr(func_name, '.');
 	if (!instance_name) {
@@ -701,10 +702,12 @@ static struct config_group *config_desc_make(
 	int ret;
 
 	gi = container_of(group, struct gadget_info, configs_group);
-	ret = snprintf(buf, MAX_NAME_LEN, "%s", name);
-	if (ret >= MAX_NAME_LEN)
+
+	if (strlen(name) >= MAX_NAME_LEN)
 		return ERR_PTR(-ENAMETOOLONG);
 
+	scnprintf(buf, MAX_NAME_LEN, "%s", name);
+
 	num_str = strchr(buf, '.');
 	if (!num_str) {
 		pr_err("Unable to locate . in name.bConfigurationValue\n");
-- 
2.43.0.472.g3155946c3a-goog

