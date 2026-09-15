Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2310F49E5ED
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476968; cv=pass; b=BW//gH7fiPq+7mRCp4+7qP64CrVnd+HjcqE/9FAd2cB65QPHFyAZLqKLFvkDYLs5wVdAp38ITHfZLs2h7UCBopZ3FqolAywi8eXOW5CBISkhRke9sePgiHsQLs2CkwZ2+kEp7QDr3S2m8WVyY/rGSK9O8YyBigs+T0TEAzkLX3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476968; c=relaxed/simple;
	bh=lptDTinqS2O4iH2BdD+2V6g8ultnlsGym/oSH1RUEHk=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=dTXvrXODMc6jZHGLiMWzLRMEEeA82hEa7Em9JbvBJMy8w4cjlk1smA0vP0sfYV/Nm0HOvh3gWhaEaCrYPvDWpp6fBGtnBWHf+ch8hoF+0xoW/Y0RPk/sjHuvSBtCIAsrd7wRvAxInxkQzeoAmb6hd2llsnS2lHYpcBHAh2kiZ6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHIlL1pq; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHIlL1pq"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so2080515e9.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 05:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789476964; cv=none;
        d=google.com; s=arc-20260327;
        b=QJFHG/L5WxutJFHNgHRkmxFnMmIgTU7CZwp9uUrBl6eq3XX2Wb/TTnfPK4nYitpMED
         VwC1CJ+TsMZDCj1j8pjfIdb2cZUXXn6F0G6ZYoIuxHl1+qR2FU8kA/K7xgnc9WuKf3jR
         F1qdOA0H/AU1bZjOoNPuCH1fPqmHbcmnzAbPR5ynvuXinmsNwuMwrkUeJtg98OuesAPS
         DQfZofIHxpLb3ow2PyGvC9hTRwOAv+iHvky3gjXWbpYjwvKejlhSaiHxwFTtZUONvtWA
         4+MMlkgY/CvwZJ1eK7/VhHnH77Z/gnNMeBhUfDqFakL3OTLW+rHetZMZehlqxh1PmDim
         Oe8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=Sfoo6snpWEELIai1Bnpyg0IHTHoa6v8acWhInSK9DSY=;
        fh=EsVmCfOyHZDg+sq0YpxM8K2MaA9PBI1yvD6OsddoRBQ=;
        b=Z8x+AHzAzsJ42djMkv9h8aCyHjUlLbU0Hp86WUyju3h72mH/GoRCaOlR9vjrxg21x0
         KUoi4L2qB0jyS8JbxaALI7mmwGLWNlvXiUjz2BD87VzxiosQpPwoQ79putrRsYo3bIt2
         TvUxBeHGBQ4egIgNsUjagkHdq5BzwbF7HjytYZ6019DEiCVWuSLLVDRh2lM/CsJcix97
         quCaa2MgNtq+k8OAxbmVW5XgIkg5Vs9QsYlhpxhP4WMtHcPU2GtUoMzPCvVTdaDbbk9Y
         2OcJjSALNvtDVJ2PhHd6RlqKyC5uaC5KLiXfjByxHz6yKVitRhdyHgbh5AyqEB5y+J41
         maWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476964; x=1790081764; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sfoo6snpWEELIai1Bnpyg0IHTHoa6v8acWhInSK9DSY=;
        b=NHIlL1pqdx7hmltcUW9Yswd+z0YCgK9JMDs6s3ux9W43yk8OVIVh865Roxnl1MqJI+
         1Gur403KJMYxxYXcwyJtBdYhfbJu4tfUySfS7jCEEvRVRlPY5ZSkL6iTx5u2kvTjgz5q
         f6mx1Hc12AL9uMBq0PWnWxBIIi5/RJxkzNDlHO8Ljp9eOLOqF4HqeCRjV8HPMCyCkWcn
         vvtwOrvdqEQoKSEhUhnmbCjTK5geebYGtrHNnGo7NobdIG8hAq6ysl/XTDZGLbJ0ky4b
         N0VGMcPHdJ/t6Yuqhxeluj3F0rcw6fHOQQvPVjLCfemdgjA47bn9UXeIAcLQYr/qHGjZ
         XkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476964; x=1790081764;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sfoo6snpWEELIai1Bnpyg0IHTHoa6v8acWhInSK9DSY=;
        b=bj/ZZGeKnu339dSdETlHB3PJB+knakUupwQbJaWkGavvX9WxnvWRZ8APcgadzBfD3a
         lMIp90G7PtsGEGQem+AoavLWQw8p0YFuXpMRGgWtVoUrc1evt58rehJJkb/Nrgxqne+M
         fL1yu6kn8qUhVV/LATuLTl8YTJQMA34NNOqKcWOzgL69ThK1yEr/Wdu/t1M3P95umH2F
         2HQHuRNqqY7dQBU13BizCVUhvdbPXc7fcV4o/+bT6PVtZNx2sFXzY/ND6CcjN9RC1d+a
         nM71sv6KIFYiY4aQ6TnK1Thy52uoRVhI6AmIqjzGdo6Cit1XAnu1NZdTsgaWcSQIPCqK
         32TA==
X-Gm-Message-State: AFuF++lOO3vHILt5PosX1znRh7cgTPUEH20iVidRT4p3H3etuqFCBiRg
	agccV1iFvOSWYwxMysWoV89hcssf1gent8Vy+IHkt1UIVuoFOZcI770bRFMjvqxOe+WcKwZzAQ8
	IWUgDDHC/ElTBkuOxTKgkX6epW0hl7sMC+a6r6zlR0NO4
X-Gm-Gg: AYBFou3oXtBDUaxa6/Z0lohK9pybCnwwUZvOM57+uSnhkggbfVLt4mkFWb6mI3bMBjm
	SbD03zdU+LvIDxyMwHKNfen7s5PlWDJXjcjNLkJazuDOwihy89hTYEUS8mw/EYXKOAQDRe7grdw
	qF5IDVZVM3INnXQ1CbvXJ5rqdqIR8bpOYtAq1vbAcRImx98d+ViRkXSwLMEtnlUSE9bFSCDaWBL
	pQ0RSD1ebXnOq2jHtzTZYYpg7BhzKHvjjDVusjUF8MteLLXTAMXLs0yNlNIBmpJavDTqfqSaeud
	beOgSiu5XPKwbBnlUH++ecoS95szrAmomfH+SoZB/z+5gkUxAq8n+Q==
X-Received: by 2002:a05:600c:4753:b0:49c:fed6:cd3f with SMTP id
 5b1f17b1804b1-49e8228ee04mr15859635e9.23.1789476964146; Tue, 15 Sep 2026
 05:56:04 -0700 (PDT)
Received: from 830778650420 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 05:56:03 -0700
Received: from 830778650420 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 05:56:03 -0700
From: Ruslan Vagner <rusya92266@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 05:56:03 -0700
X-Gm-Features: AcwNN1Vp4fdUTf4wmhOHRsqLYdCTR4o6k-5876wzWP-J7PB1mSaxbLp1TEmU39c
Message-ID: <CAF9RqJ4WtLL=o43Mcc4v0hSxLCo=nZ4gAp6_kbdQv2fj5JxZ7w@mail.gmail.com>
Subject: [PATCH] USB: fix comment typos in xhci-dbgtty and udc-xilinx
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com, 
	Ruslan Vagner <rusya92266@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Fix the spelling in comments. No functional change.

Signed-off-by: Ruslan Vagner <rusya92266@gmail.com>
---
 drivers/usb/gadget/udc/udc-xilinx.c | 2 +-
 drivers/usb/host/xhci-dbgtty.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c
b/drivers/usb/gadget/udc/udc-xilinx.c
index bef06fe7543b..bd60bca95dd2 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -128,7 +128,7 @@ struct xusb_req {
  * @name: name of the endpoint
  * @epnumber: endpoint number
  * @maxpacket: maximum packet size the endpoint can store
- * @buffer0count: the size of the packet recieved in the first buffer
+ * @buffer0count: the size of the packet received in the first buffer
  * @buffer1count: the size of the packet received in the second buffer
  * @curbufnum: current buffer of endpoint that will be processed next
  * @buffer0ready: the busy state of first buffer
diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 3d51e8d82659..e1d0c6788e8d 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -129,7 +129,7 @@ static void dbc_start_rx(struct dbc_port *port)
  * Queue received data to tty buffer and push it.
  *
  * Returns nr of remaining bytes that didn't fit tty buffer, i.e. 0 if all
- * bytes sucessfullt moved. In case of error returns negative errno.
+ * bytes successfully moved. In case of error returns negative errno.
  * Call with lock held
  */
 static int dbc_rx_push_buffer(struct dbc_port *port, struct dbc_request *req)
-- 
2.54.0.windows.1
