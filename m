Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8896AA9
	for <linux-usb@vger.kernel.org>; Sun, 22 Oct 2023 10:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IeyCD1In"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FA6C433C8;
	Sun, 22 Oct 2023 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697971674;
	bh=BoPNcV27Uz+mTokqyHQ/JjVxFWBVv3OMy/RdThGw6B0=;
	h=Date:From:To:Cc:Subject:From;
	b=IeyCD1InS5t8t02sIOBZJsFyZGO5idW+QaAlyULVabQjAbQVlGc9nrC1qQOdB+RDP
	 36UeMm1kFSax0X0xr2rSV/0t1TK2oSypaBOTkAvZVHKG8eeR2rAe9bAaRmYuf/HNRx
	 USxmkO0TLFuMTglGtYD55yXov36ntWwar9fqDFv8=
Date: Sun, 22 Oct 2023 12:47:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: linux.usb.ids@gmail.com
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb.ids: update the USB Class codes
Message-ID: <2023102224-lagged-coffee-db34@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There are a number of newer USB class codes that are missing from
usb.ids, so update them to the latest approved values.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--- a/usb.ids
+++ b/usb.ids
@@ -23876,6 +23876,22 @@ C 0e  Video
 	01  Video Control
 	02  Video Streaming
 	03  Video Interface Collection
+C 0f  Personal Healthcare
+C 10  Audio/Video
+	00  AVData Control
+	01  AVData Video Stream
+	01  AVData Audio Stream
+C 11  Billboard
+C 12  TypeC Bridge
+C 13  Bulk Display
+C 14  MCTCP over USB
+	00  MCTCP Management
+		01  MCTCP 1.x
+		02  MCTCP 2.x
+	01  MCTCP Host
+		01  MCTCP 1.x
+		02  MCTCP 2.x
+C 3c  I3C
 C 58  Xbox
 	42  Controller
 C dc  Diagnostic
