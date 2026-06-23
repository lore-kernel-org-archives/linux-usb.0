Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FE3244694;
	Tue, 23 Jun 2026 13:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782221934; cv=none; b=hVYT7K4cpzO+RtTdbo2faM/CmaXVx/2fd3IXn373MdeJFz75ZnRNN+1ABJyBgjebH+JAUlw1A81w0VsW4uJao/wYm+J/RoqqJy5usofBXIWlFOoZkNeUGR5fxHTMV8ZQ7B4viNHASYDWZ/RVSVwpp6TuiuGp8j+zXg5/dLqONIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782221934; c=relaxed/simple;
	bh=rdIiEiqORGFMd419s1rPy0RcJsLRhkDijTmzVR9Hv5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p/1RjRx6Y+iIPecYWXP9F1nq3+u8ypZHIEAiK8rnwcdiJHMvPS5Afu1B+SQOdkeDTlWiArHLQbhxNr8k6cSUD3DP7gJUWBpPKcuCQuAvWHgRe7A+JugBhowB48qJaoMbfe7WE8+3NM1cKkNbP0lpyUy+JrEvl82XkG4+2ks06nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=MsRGYAJy; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="MsRGYAJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782221900;
	bh=CUq9uMqj8lss7P0RA5ytDq6vUrCVmrLAjy/ms1mG0jg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MsRGYAJyQyIJZgD2O3xDAThHa5lOYxtxwhwSjlMj/gPqgZxzdDKD5PEb8qnQ/Bfpe
	 9vUmeZXx3blCOpzKYobqdTozz5M0HQ70SSNTzBglAJGMVrVCeT5HcpbQx1RDnrLwkk
	 aOZRsPtkpQ0HSqYGUuD+DugWwQVpJABjeRrpwd9Q=
X-QQ-mid: zesmtpgz3t1782221882t62caaee6
X-QQ-Originating-IP: dZ1oTjGJLtCnPiveTtRt6uy2SmSRLwKUSU7HFsDex+M=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Jun 2026 21:38:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14857673330865042966
EX-QQ-RecipientCnt: 6
From: raoxu <raoxu@uniontech.com>
To: andreas.noever@gmail.com
Cc: westeri@kernel.org,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH V2] thunderbolt: fix bandwidth group reservation indexing
Date: Tue, 23 Jun 2026 21:37:59 +0800
Message-ID: <E53B82E8FA767BC5+20260623133759.3019094-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MUIhDWa+DFIVuVUDIgT/oh37TYPWHF680c+DJKbmQS4hx6Yx9HFsQHOt
	gAx8qzblDEwldaLHwTC4DHmHHiV3K8Nwm4aHgA3IM66ZScKs37nFfMSyUBPiOJK8nZrKyzN
	qnJTr4S1KoIPmYKWrESxRsZutgxxHIaAVvsKt7/rhvRjRg63nDgmbUaY2RzguSeKFGZvCA0
	nzIqDsjdUC8fbAQ38vRRYAE1dhWw2ZKz/JYrdOmesaaEB4jYAYn9H5BhEHCpdLOrO3XuZlN
	KsO6ShBlgnr8NuNsLRK80eP99q2WjEF0wSRBxh868B4mLR7BXapiGI6PYeaujKJ4SUUC5Ui
	5/Kxr3McB3I8nlYR6OISa8LAphP9T2B9R4yz2l6VwDPhjqeXvwWrbd9QBB72FEJwzp7RsCE
	CGX0PcslNoNw4dQs3sd4OFLPGBI1mjSJ5gZVX0CDeJ/ThX4KilZ7dnhDt75rvbCc8XvU2py
	3OhNCLhRnIWkHjUarQN9Y61bfG+FqI4m3pOciCh4/r3U+i+aw0DNS5azedi0GVThPPiTdf9
	NOB/Ok2wan+LrBKutlRA0mF8CdQJpShTtHZnmiHQtGvf7Df3dQHuSclwurn4OvovWsVE65u
	6fNawNKFsTwZAOU5kD/TEp6gzLHJj2xzz9VmZ0e+nRAS88aMqRZ7DmBaFGICvNyek5sSOPx
	TeUCw3QTjZYihb4vUR/YRnUEub2YNPxUVR6ovzJkCbDJ3U7eohlBwQVatcgP+FVmYcvdNER
	Lwaue37p2YYxBWAPZOsM56ek26WVLxKUTKzw+94AL4OXGtDAJH+eUAd6r3JU0NMTxVCGzkv
	FSj1x4fidI/Al/IN1DUkRLb4766YXQqLfKTQXde5gBq+jKHHSZXN0qNz+uF5LN39WmK9N7M
	Lgc/IMamqfIuIJPAhHVJOdxo1e27gMqtwzktQdmau0iE8Thnu3sSL3jb1EkbbxSbsBIR2tK
	IAqRxHVdup+KF31O9w9rN35bmMvUrDL43WA+UxXt9igDcq0oaAsS8t6dlrfU+mkqACckCAC
	4r9DHasgpJG2a93HIWNLfaRhPfwVW8/Ex+UyQKUviWNMzCXG3eNNGBGtQseYw=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

Group ID 0 is reserved, while valid bandwidth groups use IDs 1 through
7. MAX_GROUPS is used both for tb_cm::groups, which stores allocatable
bandwidth groups, and for group_reserved[], which is indexed directly
by Group ID.

tb_init_bandwidth_groups() assigns i + 1 to each entry in
tb_cm::groups. Keeping seven entries therefore creates exactly the valid
Group IDs 1 through 7.

However, group_reserved[MAX_GROUPS] currently also has seven entries,
providing indices 0 through 6. When a tunnel belongs to Group ID 7,
tb_consumed_dp_bandwidth() reads and may write one element past the end
of the array. The reservation for that group is consequently not
included in the consumed bandwidth total either.

Define MAX_GROUPS as 7 + 1 so arrays indexed directly by Group ID cover
the complete 0 through 7 range, including the reserved ID 0. Size
tb_cm::groups as MAX_GROUPS - 1 so only seven bandwidth group objects
are initialized and tb_init_bandwidth_groups() continues to assign IDs
1 through 7. tb_consumed_dp_bandwidth() can then retain the direct
Group ID indexing, with Group ID 7 selecting the final valid array
element instead of accessing beyond it.

Fixes: 52a4490e89d7 ("thunderbolt: Reserve released DisplayPort bandwidth for a group for 10 seconds")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
Changes in v2:
- Drop the zero-based Group ID conversion used in v1 and keep
  group->index as the direct group_reserved[] index.
- Include the reserved Group ID 0 in MAX_GROUPS so direct-indexed arrays
  cover the complete Group ID range 0 through 7.
- Size tb_cm::groups as MAX_GROUPS - 1 so
  tb_init_bandwidth_groups() continues to create only the seven valid
  groups with IDs 1 through 7.

 drivers/thunderbolt/tb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 76323255439a..51f909db9383 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -41,7 +41,7 @@
  */
 #define TB_ASYM_THRESHOLD	45000

-#define MAX_GROUPS		7	/* max Group_ID is 7 */
+#define MAX_GROUPS		(7 + 1) /* Group ID 0 is reserved */

 static unsigned int asym_threshold = TB_ASYM_THRESHOLD;
 module_param_named(asym_threshold, asym_threshold, uint, 0444);
@@ -66,7 +66,7 @@ struct tb_cm {
 	struct list_head dp_resources;
 	bool hotplug_active;
 	struct delayed_work remove_work;
-	struct tb_bandwidth_group groups[MAX_GROUPS];
+	struct tb_bandwidth_group groups[MAX_GROUPS - 1];
 };

 static inline struct tb *tcm_to_tb(struct tb_cm *tcm)
--
2.50.1

