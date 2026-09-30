Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC914483BE
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754771; cv=none; b=jHLBOKqGzJgK8iZcoRAUb5+pZXishY0nJfLqMu0UHRWeZmJV69AvJWkddUFCzC4hnV5gwvhc6DkTDhMCaYOekS3E67tDEfdN3BDJdz8uTMsFCEZYtw7cPek2SOebQ50IS0HYOhU+J9vsBrlvLKZMtOPAj+mNv0Mf1rbGwbN0nc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754771; c=relaxed/simple;
	bh=FcfKgVtidTGfawbNAsZlmWstyb19QYDw9rtu6XxxEfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mjBRpkLhSdfd78xkt4vVUsV/y5RKkbFBLQlmQZjdQwK1cNPAIpYWk8M7qK2IH32373r7xDe0pMXpQhEYzc2FLS21QBGXfEuFpJf6yNzL74oHn7X1KYiVRyFYiBwDecehoVdpcfmw6HTfRuLhmFxOE3NhbYuP4ZVQpxN3voCpCB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMhZYuuo; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMhZYuuo"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d58a3b05so9135725ad.0
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 00:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790754769; x=1791359569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hvZbxSF2qQnQhtXPVG06mkg9nimx73LR88KWFA5uNNc=;
        b=mMhZYuuoKAgjONELGoyNF5x5dTfFJm6BB22nnK6E3QRVIAghjONsvwLSqo8pJucGFN
         wF+MXvscjomXSBvB0VCbRTZ51oZJ32lj24HRxmzmMMSq2EXhVEZpteaso/cA149ugzxG
         gRclowD3uk9/S9rANTUejcBkEj+ChsL94k6DcGBqOjIyNquW5OcYv4Oot6MdW9Os8Lsh
         mXiLgw5D04mMdqvX9KuUWtT6wEeZFTa0yDHKjR1hD2CpoobNfMeGMbdmhvyF3pb5Cw6o
         DnsFmaG0eP+N/e+CHi2SbVWaBvNmCgk745N/32Ky7LeIEY3A/qOxAjg0FIyY7ahNufUT
         4jWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790754769; x=1791359569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hvZbxSF2qQnQhtXPVG06mkg9nimx73LR88KWFA5uNNc=;
        b=THgV6byv+q0nHv9VjryMIupkwLjiCCO79U1jC5Crrkakxx4hDxuBO70EF4HT98741A
         /4aMCYCEjELbJDDWz5aoYTjB8KsR3luB43Rmr+AXZtekyT2o2KQCoto5t2fAAkkAKtYe
         Rgi0q1DXP66fY5/oeXT9l/ydffAahjJ0Kb17MMiWg0GmfokM4GXv/5OAd3V0EU+o+dJP
         Nk6VhiluV4GGcu23ONKhz4vjrayqN2uMoxVLVFPX6Z//HN3nqbD6y3fg5nJyrrPrsB4y
         hqWqGu3gLxKBpHnAUw223J5JvOugv5PGHZB7QpIhBQ5jcGzwSXMMiWPfbLSII7N7FBup
         ICmQ==
X-Gm-Message-State: AFq9FYLFmchgaO70zVsoQ8RW9PT7vzmOPe0qmkXMTKa7G83z9VXClaoC
	qK9zLzpKo2LPsaO0vPueSpjjE7LcVfIcp9kIA8r3w95oqlCGYObKidSM
X-Gm-Gg: AYBFou1OSODEgg0jbyAibXQj4u8fR8lPMEwA/PZcxMl57zigpHTtRRUBiMjXgb4OgtQ
	nea4z2Adp2U+lESrVVEN2I4MsMnpOD1tHDGwHcCGuzOqeE71l7qleEyd9XleQ9oEsPGSBlLHQ5a
	vJChI9ZY7/x4dfPOlDYsZvrg3/lDqrq6z8cSgvK3kLF6BeHQIu6WWySnVv/J25VtqHyRFidB6pr
	/F4kFAmn9wZY/jWbUB8G0SLkP8Z23dyyqe7HzKAtH0vS5IIQ16XnOliOCHsO0WsYGHNgn1TtrhU
	XrnYH7SlReodnLOtfnGUyt/+gVfsz6g8CAOQokWg6pnioXnYl5c+b0MVN24clkwpNvoe+ZzTAz1
	n3uEvy5w6ts4ndo669qh+FHWHZ/rzzDsRYcrmzaLTsciQOyKww+Pc7giPcxNjskBHiN9ZuuR62O
	muWPgaW2YfXfIQ3HTGxBJK6vdOke470SXPLLJT1o+mSk9Zjodndz699aibAL9z3qikW3jL5H1iA
	0tg+V9Ly6iCMYqCcJ1LFlxYI47Ps50rSzIOoknh+dk6HXwNd8AlIiP4q0HyBN3/h8hnQZiKrRCt
	RBtJT9bsi4lGovx/J7pT
X-Received: by 2002:a17:902:e88c:b0:2d1:134:b86e with SMTP id d9443c01a7336-2e2e48adf58mr5499355ad.2.1790754769287;
        Wed, 30 Sep 2026 00:52:49 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c1408bsm3001265ad.64.2026.09.30.00.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:52:48 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v4] USB: serial: garmin_gps: validate packet data length in nat_receive()
Date: Wed, 30 Sep 2026 07:52:47 +0000
Message-ID: <20260930075247.471109-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <2026092059-hacking-coveting-c629@gregkh>
References: <20260919112819.3885778-1-benquike@gmail.com> <2026092059-hacking-coveting-c629@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nat_receive() (called from garmin_write() when userspace writes to
/dev/ttyUSBn in MODE_NATIVE mode), while garmin_data_p->insize is less
than GARMIN_PKTHDR_LENGTH (12), the loop copies up to 12 bytes into
garmin_data_p->inbuffer. Once garmin_data_p->insize reaches
GARMIN_PKTHDR_LENGTH, nat_receive() computes the total packet size as:

  len = GARMIN_PKTHDR_LENGTH + getDataLength(garmin_data_p->inbuffer);

Because getDataLength() returns a signed int from __le32_to_cpup(), a
12-byte header with a negative 32-bit length field (such as 0xfffffff5,
i.e., -11) causes len to underflow to a small positive value (12 + (-11)
= 1) without any bounds check at that point. Then garmin_data_p->insize
>= len (12 >= 1) evaluates to true and nat_receive() calls
garmin_write_bulk(port, inbuffer, 1, 0), which allocates a 1-byte slab
buffer via kmemdup() and immediately reads 4 bytes from it in
getLayerId(buffer) (and again in garmin_write_bulk_callback() when the
URB completes):

  BUG: KASAN: slab-out-of-bounds in garmin_write_bulk.constprop.0+0x3eb/0x500
  Read of size 4 at addr ffff888002cc0ba0 by task init/1
  Call Trace:
   <TASK>
   dump_stack_lvl+0x70/0xa0
   print_report+0x153/0x4c6
   kasan_report+0xf1/0x120
   garmin_write_bulk.constprop.0+0x3eb/0x500
   garmin_write+0x60f/0x1450
   serial_write+0x123/0x200
   n_tty_write+0x8ea/0xeb0
   file_tty_write.isra.0+0x44f/0x7a0
   vfs_write+0x671/0xd20

Validate the unsigned 32-bit data length (dlen >= GPS_IN_BUFSIZ -
GARMIN_PKTHDR_LENGTH, matching the existing len >= GPS_IN_BUFSIZ bound)
in nat_receive() as soon as the 12-byte header is present, resetting
insize and returning -EINVPKT on invalid lengths so garmin_write_bulk()
is only ever called with a full valid packet header (12 <= len <
GPS_IN_BUFSIZ).

Tested in QEMU against Linux 7.3.0-rc3 by emulating a Garmin USB GPS
device (091e:0003) via dummy_hcd + raw-gadget, switching /dev/ttyUSB0
to MODE_NATIVE via PRIV_PKTID_SET_MODE, and writing a 12-byte native
packet with data length 0xfffffff5: on the unfixed kernel this triggers
KASAN slab-out-of-bounds reads in garmin_write_bulk() and
garmin_write_bulk_callback(), whereas on the fixed kernel nat_receive()
rejects the packet with -EINVPKT and 0 KASAN faults.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v4:
- Kept the fix strictly inside nat_receive() and dropped the other hunks
  from v3 (garmin_write_bulk_callback(), gsp_send(), and changing the
  return type of getDataLength() / getPacketId()) per Greg
  Kroah-Hartman:
  1. Assigning u32 dlen = getDataLength(garmin_data_p->inbuffer) locally
     in nat_receive() and rejecting dlen >= GPS_IN_BUFSIZ -
     GARMIN_PKTHDR_LENGTH (matching the existing len >= GPS_IN_BUFSIZ
     check at the top of the loop) prevents both negative/underflowed
     lengths (< 12 bytes) and oversized lengths without needing to touch
     getDataLength() across the file.
  2. The out-of-bounds read in garmin_write_bulk() and
     garmin_write_bulk_callback() was only reachable because
     nat_receive() allowed len to underflow below GARMIN_PKTHDR_LENGTH
     (12 bytes). All other callers of garmin_write_bulk() always pass at
     least GARMIN_PKTHDR_LENGTH bytes, making a separate length check in
     garmin_write_bulk_callback() redundant.
  3. In MODE_GARMIN_SERIAL, gsp_receive() already bounds insize to
     MAX_SERIAL_PKT_SIZ + 2 before calling gsp_send(), so the extra
     bounds check in gsp_send() was an unrelated defensive check.
- Added Cc: stable@vger.kernel.org and QEMU reproduction details.

 drivers/usb/serial/garmin_gps.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
index 8020149f5658..a3f599043a4d 100644
--- a/drivers/usb/serial/garmin_gps.c
+++ b/drivers/usb/serial/garmin_gps.c
@@ -769,8 +769,14 @@ static int nat_receive(struct garmin_data *garmin_data_p,
 
 		/* do we have a complete packet ? */
 		if (garmin_data_p->insize >= GARMIN_PKTHDR_LENGTH) {
-			len = GARMIN_PKTHDR_LENGTH+
-			   getDataLength(garmin_data_p->inbuffer);
+			u32 dlen = getDataLength(garmin_data_p->inbuffer);
+
+			if (dlen >= GPS_IN_BUFSIZ - GARMIN_PKTHDR_LENGTH) {
+				garmin_data_p->insize = 0;
+				result = -EINVPKT;
+				break;
+			}
+			len = GARMIN_PKTHDR_LENGTH + dlen;
 			if (garmin_data_p->insize >= len) {
 				garmin_write_bulk(garmin_data_p->port,
 						   garmin_data_p->inbuffer,
-- 
2.49.0
